#!/usr/bin/env python3
"""Build a seed URL list for `mirror.py live --seeds` from every discovery channel.

FEATURE-CARD >> features/mirror-coverage.feature

BFS from one entry page cannot reach a page nothing links to. amasci.com proves it:
http://amasci.com/refs.html (Beaty's own résumé, at the site root) is live and was
never found by link-following, and 209 of the 899 URLs in Beatty's OWN sitemap were
absent from our mirror.

So discovery must not rely on link-following alone. This gathers seeds from every
channel a site actually offers, in rough order of authority:

  1. robots.txt `Sitemap:` directives      — the owner telling you where the map is
  2. that sitemap (XML <loc> or HTML <a>)  — the owner's own page inventory
  3. /sitemap.html, /sitemap.xml           — conventional locations
  4. the site's own index/stats pages      — amasci has stats/idbylink2.html, an
                                             auto-generated index of 1,517 links
  5. same-domain URLs cited by pages we
     already hold but do NOT have on disk  — the internal-link gap
  6. Wayback CDX paths (optional)          — everything that ever existed

robots.txt `Disallow` paths are EXCLUDED by default: the site owner asked. Override
with --ignore-robots only if you have a reason, and it will tell you what it added.

Usage:
    python3 scripts/build_seed_list.py amasci.com --out seeds.txt
    python3 scripts/build_seed_list.py amasci.com --out seeds.txt --wayback --probe
"""

import argparse
import os
import re
import sys
import urllib.parse
import urllib.request

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import mirror  # noqa: E402
import mirror_coverage as mc  # noqa: E402

UA = {"User-Agent": "merlib-mirror/seeds"}


def fetch(url, timeout=30):
    try:
        req = urllib.request.Request(url, headers=UA)
        with urllib.request.urlopen(req, timeout=timeout) as r:
            return r.read().decode("utf-8", errors="replace")
    except Exception:
        return None


def parse_robots(base):
    """Return (sitemap_urls, disallowed_prefixes)."""
    body = fetch(base + "/robots.txt")
    sitemaps, disallow = [], []
    if not body:
        return sitemaps, disallow
    for line in body.splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        key, _, val = line.partition(":")
        key, val = key.strip().lower(), val.strip()
        if key == "sitemap" and val:
            sitemaps.append(val)
        elif key == "disallow" and val:
            disallow.append(val)
    return sitemaps, disallow


def urls_from_sitemap(text, base_url):
    """<loc> entries if XML, else every <a href> if it's an HTML sitemap."""
    out = set()
    for m in re.finditer(r"<loc>\s*([^<\s]+)\s*</loc>", text, re.IGNORECASE):
        out.add(m.group(1).strip())
    if not out:
        try:
            out |= mirror.extract_links(text, base_url)
        except Exception:
            pass
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("domain")
    ap.add_argument("--scheme", default=None, choices=["http", "https"])
    ap.add_argument("--site-dir", default=None)
    ap.add_argument("--out", required=True)
    ap.add_argument("--wayback", action="store_true",
                    help="also seed from the Wayback CDX inventory")
    ap.add_argument("--probe", action="store_true",
                    help="with --wayback: keep only Wayback paths that are LIVE now "
                         "(slow: one HEAD each)")
    ap.add_argument("--probe-limit", type=int, default=1200)
    ap.add_argument("--ignore-robots", action="store_true")
    a = ap.parse_args()

    domain = a.domain
    site_dir = os.path.abspath(a.site_dir or os.path.join(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "sites", domain))
    scheme = a.scheme or (mc.detect_scheme(site_dir, domain)
                          if os.path.isdir(site_dir) else "http")
    base = f"{scheme}://{domain}"
    print(f"seed-list for {domain} (scheme={scheme}, site_dir={site_dir})")

    seeds, sources = set(), {}

    def add(urls, label):
        new = 0
        for u in urls:
            u = urllib.parse.urldefrag(u.strip())[0]
            if not u or mirror.should_skip_url(u, domain):
                continue
            if mc.classify_missing(u) != "gap":  # skip .cgi / query / broken
                continue
            if u not in seeds:
                seeds.add(u)
                new += 1
        sources[label] = new
        print(f"  + {new:>6,} new from {label}")

    # 1 + 2 — robots.txt and the sitemaps it names
    sitemaps, disallow = parse_robots(base)
    print(f"  robots.txt: {len(sitemaps)} sitemap directive(s), "
          f"{len(disallow)} Disallow rule(s)")
    for sm in sitemaps:
        body = fetch(sm)
        if body:
            add(urls_from_sitemap(body, sm), f"sitemap {sm}")

    # 3 — conventional locations. A 300 MultiViews response NAMES the real file,
    # so parse its "Available documents" list instead of giving up.
    for cand in ("/sitemap.html", "/sitemap.xml", "/sitemap.txt"):
        body = fetch(base + cand)
        if not body:
            continue
        if "300 Multiple Choices" in body or "Available documents" in body:
            alts = mirror.extract_links(body, base + cand)
            add(alts, f"300-MultiViews alternatives for {cand}")
            for alt in alts:
                b2 = fetch(alt)
                if b2:
                    add(urls_from_sitemap(b2, alt), f"sitemap {alt}")
            continue
        add(urls_from_sitemap(body, base + cand), f"sitemap {cand}")

    # 4 + 5 — the site's own index pages, and the internal-link gap. Both come
    # from what we already hold, so they cost nothing.
    if os.path.isdir(site_dir):
        cov = mc.internal_link_coverage(site_dir, host=domain, scheme=scheme)
        add(cov["gap"].keys(), "internal-link gap (pages we cite but lack)")
        idx = []
        for rel, path in mc.mirrored_html(site_dir):
            if "stats/" in rel or "index" in os.path.basename(rel).lower() \
                    or "sitemap" in rel.lower():
                try:
                    idx.extend(mirror.extract_links(
                        mc.__dict__.get("_dummy") or open(path, errors="replace").read(),
                        f"{scheme}://{domain}/{rel}"))
                except Exception:
                    pass
        add(idx, "site's own index/stats pages")

    # 6 — the historical inventory
    if a.wayback:
        try:
            inv = mc.wayback_inventory(domain)
            cand = []
            for u in inv:
                lp = mirror.sanitize_path(u)
                f = os.path.join(site_dir, lp)
                if not (os.path.exists(f) and os.path.getsize(f) > 0):
                    cand.append(u.replace("https://", f"{scheme}://", 1))
            cand = [u for u in cand if mc.classify_missing(u) == "gap"]
            print(f"  wayback: {len(cand):,} absent static path(s)")
            if a.probe:
                n = min(a.probe_limit, len(cand))
                step = max(1, len(cand) // n)
                sample = cand[::step][:n]
                print(f"  probing {len(sample):,} against the live server "
                      f"(only LIVE ones are seeded)…")
                res = mc.live_probe(sample)
                live = [u for u, v in res.items()
                        if isinstance(v, int) and 200 <= v < 300]
                print(f"    {len(live)} live of {len(sample)} sampled "
                      f"({100.0*len(live)/max(1,len(sample)):.1f}%)")
                add(live, "wayback paths verified LIVE")
            else:
                add(cand, "wayback absent static paths (UNVERIFIED — many are 404)")
        except Exception as e:
            print(f"  wayback skipped: {type(e).__name__}: {e}")

    # robots Disallow
    if disallow and not a.ignore_robots:
        before = len(seeds)
        seeds = {u for u in seeds
                 if not any(urllib.parse.urlparse(u).path.startswith(d)
                            for d in disallow)}
        print(f"  - {before - len(seeds):,} excluded by robots.txt Disallow "
              f"(use --ignore-robots to include)")
    elif disallow:
        print(f"  ! robots.txt Disallow IGNORED — {len(disallow)} rule(s) bypassed "
              f"on request")

    with open(a.out, "w") as fh:
        fh.write("\n".join(sorted(seeds)) + "\n")
    print(f"\nwrote {len(seeds):,} seed URL(s) to {a.out}")
    print(f"next: python3 mirror.py live {base}/ --seeds {a.out} --output-dir sites")
    return 0


if __name__ == "__main__":
    sys.exit(main())
