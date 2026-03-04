#!/usr/bin/env python3
"""Unit tests for mirror.py — stdlib unittest only."""

import os
import sys
import tempfile
import shutil
import unittest

# Import mirror module from same directory
sys.path.insert(0, os.path.dirname(__file__))
import mirror


class TestAutoDetect(unittest.TestCase):
    """Test auto_detect() mode inference from user input."""

    def test_bare_domain(self):
        mode, info = mirror.auto_detect("riess.org")
        self.assertEqual(mode, "wayback")
        self.assertEqual(info["domain"], "riess.org")

    def test_wayback_url(self):
        mode, info = mirror.auto_detect(
            "https://web.archive.org/web/20220428030850/https://www.cheniere.org/"
        )
        self.assertEqual(mode, "wayback")
        self.assertEqual(info["domain"], "cheniere.org")
        self.assertEqual(info["ts_from"], "20220428")

    def test_live_url(self):
        mode, info = mirror.auto_detect("https://example.com/page")
        self.assertEqual(mode, "live")
        self.assertEqual(info["url"], "https://example.com/page")

    def test_http_live_url(self):
        mode, info = mirror.auto_detect("http://example.com")
        self.assertEqual(mode, "live")

    def test_unrecognized(self):
        mode, info = mirror.auto_detect("not-a-domain")
        self.assertIsNone(mode)


class TestParseWaybackUrl(unittest.TestCase):
    """Test parse_wayback_url() domain/timestamp extraction."""

    def test_standard(self):
        domain, ts = mirror.parse_wayback_url(
            "https://web.archive.org/web/20081104000746/http://tesla.hu/"
        )
        self.assertEqual(domain, "tesla.hu")
        self.assertEqual(ts, "20081104000746")

    def test_https_www(self):
        domain, ts = mirror.parse_wayback_url(
            "https://web.archive.org/web/20220428030850/https://www.cheniere.org/"
        )
        self.assertEqual(domain, "cheniere.org")

    def test_wildcard(self):
        domain, ts = mirror.parse_wayback_url(
            "https://web.archive.org/web/*/riess.org"
        )
        self.assertEqual(domain, "riess.org")
        self.assertIsNone(ts)

    def test_trailing_path(self):
        domain, ts = mirror.parse_wayback_url(
            "https://web.archive.org/web/20200101/http://example.org/page/sub"
        )
        self.assertEqual(domain, "example.org")

    def test_invalid(self):
        domain, ts = mirror.parse_wayback_url("https://example.com")
        self.assertIsNone(domain)
        self.assertIsNone(ts)


class TestSanitizePath(unittest.TestCase):
    """Test sanitize_path() URL-to-filesystem mapping."""

    def test_root(self):
        path = mirror.sanitize_path("http://example.com/")
        self.assertEqual(path, "index.html")

    def test_empty_path(self):
        path = mirror.sanitize_path("http://example.com")
        self.assertEqual(path, "index.html")

    def test_directory(self):
        path = mirror.sanitize_path("http://example.com/articles/")
        self.assertEqual(path, "articles/index.html")

    def test_extension_preserved(self):
        path = mirror.sanitize_path("http://example.com/doc.pdf")
        self.assertEqual(path, "doc.pdf")

    def test_query_string(self):
        path = mirror.sanitize_path("http://example.com/page?id=42&lang=en")
        self.assertIn("__", path)
        self.assertIn("id", path)

    def test_no_extension_gets_html(self):
        path = mirror.sanitize_path("http://example.com/about")
        self.assertTrue(path.endswith(".html"))

    def test_special_chars_sanitized(self):
        path = mirror.sanitize_path("http://example.com/file<name>.html")
        self.assertNotIn("<", path)
        self.assertNotIn(">", path)

    def test_nested_path(self):
        path = mirror.sanitize_path("http://example.com/a/b/c/page.html")
        self.assertEqual(path, "a/b/c/page.html")


class TestStripWaybackToolbar(unittest.TestCase):
    """Test strip_wayback_toolbar() regex cleanup."""

    def test_begin_end_toolbar(self):
        html = "before<!-- BEGIN WAYBACK TOOLBAR INSERT -->toolbar stuff<!-- END WAYBACK TOOLBAR INSERT -->after"
        result = mirror.strip_wayback_toolbar(html)
        self.assertEqual(result, "beforeafter")

    def test_file_archived_comment(self):
        html = "x<!-- FILE ARCHIVED ON 20220101 by Wayback -->y"
        result = mirror.strip_wayback_toolbar(html)
        self.assertEqual(result, "xy")

    def test_wombat_script(self):
        html = 'before<script src="/static/wombat.js">code</script>after'
        result = mirror.strip_wayback_toolbar(html)
        self.assertEqual(result, "beforeafter")

    def test_wm_script(self):
        html = 'a<script src="wm.js">x</script>b'
        result = mirror.strip_wayback_toolbar(html)
        self.assertEqual(result, "ab")

    def test_wm_init_script(self):
        html = 'a<script>var x = __wm.init();</script>b'
        result = mirror.strip_wayback_toolbar(html)
        self.assertEqual(result, "ab")

    def test_wombat_init_script(self):
        html = 'a<script>WB_wombat_Init("foo")</script>b'
        result = mirror.strip_wayback_toolbar(html)
        self.assertEqual(result, "ab")

    def test_banner_css(self):
        html = 'a<link rel="stylesheet" href="_static/css/banner-styles.css">b'
        result = mirror.strip_wayback_toolbar(html)
        self.assertEqual(result, "ab")

    def test_noscript_wayback(self):
        html = "a<noscript>Please enable JS for wayback features</noscript>b"
        result = mirror.strip_wayback_toolbar(html)
        self.assertEqual(result, "ab")

    def test_bytes_input(self):
        html = b"before<!-- BEGIN WAYBACK TOOLBAR INSERT -->junk<!-- END WAYBACK TOOLBAR INSERT -->after"
        result = mirror.strip_wayback_toolbar(html)
        self.assertEqual(result, "beforeafter")

    def test_clean_html_unchanged(self):
        html = "<html><body><p>Hello world</p></body></html>"
        result = mirror.strip_wayback_toolbar(html)
        self.assertEqual(result, html)


class TestRewriteUrls(unittest.TestCase):
    """Test rewrite_urls() Wayback URL cleanup."""

    def test_absolute_wayback_url(self):
        html = 'href="https://web.archive.org/web/20220101id_/https://example.org/page"'
        result = mirror.rewrite_urls(html, "example.org")
        self.assertIn("/page", result)
        self.assertNotIn("web.archive.org", result)

    def test_relative_wayback_url(self):
        html = 'src="/web/20220101im_/https://example.org/img.png"'
        result = mirror.rewrite_urls(html, "example.org")
        self.assertNotIn("/web/", result)

    def test_protocol_relative_wayback(self):
        # Protocol-relative wayback URLs: the /web/ pattern (pattern 2) fires
        # first and strips the timestamp+modifier; the domain→relative pattern
        # then converts the remaining absolute URL to a relative path.
        html = 'src="//web.archive.org/web/20220101id_/https://example.org/style.css"'
        result = mirror.rewrite_urls(html, "example.org")
        self.assertIn("/style.css", result)

    def test_domain_to_relative(self):
        html = 'href="https://example.org/about"'
        result = mirror.rewrite_urls(html, "example.org")
        self.assertIn("/about", result)
        self.assertNotIn("https://example.org", result)

    def test_www_domain(self):
        html = 'href="https://www.example.org/page"'
        result = mirror.rewrite_urls(html, "example.org")
        self.assertIn("/page", result)

    def test_other_domain_untouched(self):
        html = 'href="https://other.com/page"'
        result = mirror.rewrite_urls(html, "example.org")
        self.assertIn("https://other.com/page", result)


class TestExtractText(unittest.TestCase):
    """Test extract_text() HTML-to-plaintext conversion."""

    def test_script_removal(self):
        html = "<p>Hello</p><script>var x=1;</script><p>World</p>"
        text = mirror.extract_text(html)
        self.assertIn("Hello", text)
        self.assertIn("World", text)
        self.assertNotIn("var x", text)

    def test_style_removal(self):
        html = "<style>.foo { color: red; }</style><p>Content</p>"
        text = mirror.extract_text(html)
        self.assertNotIn("color", text)
        self.assertIn("Content", text)

    def test_entity_decoding(self):
        html = "<p>A &amp; B &lt; C</p>"
        text = mirror.extract_text(html)
        self.assertIn("A & B < C", text)

    def test_whitespace_normalization(self):
        html = "<p>  lots   of    spaces  </p>"
        text = mirror.extract_text(html)
        self.assertNotIn("   ", text)

    def test_bytes_input(self):
        html = b"<p>Hello</p>"
        text = mirror.extract_text(html)
        self.assertIn("Hello", text)

    def test_empty_html(self):
        text = mirror.extract_text("<html><body></body></html>")
        self.assertEqual(text, "")


class TestIsValidContent(unittest.TestCase):
    """Test is_valid_content() content validation."""

    def test_pdf_magic(self):
        self.assertTrue(mirror.is_valid_content(b"%PDF-1.4 " + b"x" * 100, ".pdf"))

    def test_pdf_wrong_magic(self):
        self.assertFalse(mirror.is_valid_content(b"<html>" + b"x" * 100, ".pdf"))

    def test_min_size(self):
        self.assertFalse(mirror.is_valid_content(b"tiny", ".html"))

    def test_empty(self):
        self.assertFalse(mirror.is_valid_content(b"", ".html"))

    def test_none(self):
        self.assertFalse(mirror.is_valid_content(None, ".html"))

    def test_html_valid(self):
        content = b"<html><body>" + b"x" * 100
        self.assertTrue(mirror.is_valid_content(content, ".html"))

    def test_html_no_tag(self):
        content = b"Just plain text " + b"x" * 100
        self.assertFalse(mirror.is_valid_content(content, ".html"))

    def test_wayback_error_page(self):
        content = b"<!DOCTYPE html><html>Wayback Machine error" + b"x" * 2000
        self.assertFalse(mirror.is_valid_content(content, ".jpg"))

    def test_binary_ok(self):
        content = b"\x89PNG" + b"\x00" * 100
        self.assertTrue(mirror.is_valid_content(content, ".png"))


class TestGetWaybackModifier(unittest.TestCase):
    """Test get_wayback_modifier() extension mapping."""

    def test_jpg_image(self):
        self.assertEqual(mirror.get_wayback_modifier(".jpg"), "im_")

    def test_png_image(self):
        self.assertEqual(mirror.get_wayback_modifier(".png"), "im_")

    def test_gif_image(self):
        self.assertEqual(mirror.get_wayback_modifier(".gif"), "im_")

    def test_html_default(self):
        self.assertEqual(mirror.get_wayback_modifier(".html"), "id_")

    def test_pdf_default(self):
        self.assertEqual(mirror.get_wayback_modifier(".pdf"), "id_")

    def test_empty_default(self):
        self.assertEqual(mirror.get_wayback_modifier(""), "id_")

    def test_case_insensitive(self):
        self.assertEqual(mirror.get_wayback_modifier(".JPG"), "im_")


class TestIsValidContentUrl(unittest.TestCase):
    """Test is_valid_content_url() URL filtering."""

    def test_valid_url(self):
        self.assertTrue(mirror.is_valid_content_url("http://example.org/page.html", "example.org"))

    def test_wrong_domain(self):
        self.assertFalse(mirror.is_valid_content_url("http://other.com/page", "example.org"))

    def test_skip_cgi(self):
        self.assertFalse(mirror.is_valid_content_url("http://example.org/cgi-bin/script", "example.org"))

    def test_skip_mailto(self):
        self.assertFalse(mirror.is_valid_content_url("mailto:user@example.org", "example.org"))

    def test_skip_robots(self):
        self.assertFalse(mirror.is_valid_content_url("http://example.org/robots.txt", "example.org"))

    def test_skip_well_known(self):
        self.assertFalse(mirror.is_valid_content_url("http://example.org/.well-known/acme", "example.org"))

    def test_skip_subject_param(self):
        self.assertFalse(mirror.is_valid_content_url("http://example.org/?subject=test", "example.org"))


class TestEnsureDirPath(unittest.TestCase):
    """Test ensure_dir_path() directory creation and conflict resolution."""

    def setUp(self):
        self.tmpdir = tempfile.mkdtemp()

    def tearDown(self):
        shutil.rmtree(self.tmpdir)

    def test_creates_directory(self):
        path = os.path.join(self.tmpdir, "a", "b", "file.html")
        mirror.ensure_dir_path(path)
        self.assertTrue(os.path.isdir(os.path.join(self.tmpdir, "a", "b")))

    def test_file_dir_conflict_rename(self):
        # Create a file where a directory needs to be
        conflict = os.path.join(self.tmpdir, "articles")
        with open(conflict, "w") as f:
            f.write("conflict")

        path = os.path.join(self.tmpdir, "articles", "page.html")
        mirror.ensure_dir_path(path)

        # File should have been renamed to articles.html
        self.assertTrue(os.path.isdir(conflict))
        self.assertTrue(os.path.exists(conflict + ".html"))

    def test_file_dir_conflict_remove(self):
        # Create both the file and its .html rename target
        conflict = os.path.join(self.tmpdir, "articles")
        with open(conflict, "w") as f:
            f.write("conflict")
        with open(conflict + ".html", "w") as f:
            f.write("existing")

        path = os.path.join(self.tmpdir, "articles", "page.html")
        mirror.ensure_dir_path(path)

        self.assertTrue(os.path.isdir(conflict))

    def test_empty_dirname(self):
        # Should not crash on a bare filename
        mirror.ensure_dir_path("file.html")


if __name__ == "__main__":
    unittest.main()
