(async function scrapeDiscord() {
  const allMessages = new Map();
  const imageURLs = [];
  const scroller = document.querySelector('[class*="managedReactiveScroller"]')
                || document.querySelector('[data-jump-section="global"][role="group"]')
                || document.querySelector('[class*="scroller__36d07"]');

  if (!scroller) {
    console.error('Could not find message scroller. Make sure you are in a Discord channel.');
    return;
  }
  console.log('%c[Discord Scraper] Found scroller:', 'color: cyan', scroller);

  // Skip emoji, sticker, and icon URLs
  function isJunkImage(src) {
    return /cdn\.discordapp\.com\/emojis\//i.test(src)
        || /cdn\.discordapp\.com\/stickers\//i.test(src)
        || /cdn\.discordapp\.com\/avatars\//i.test(src)
        || /cdn\.discordapp\.com\/clan-badges\//i.test(src)
        || /twemoji/i.test(src)
        || /emoji/i.test(src);
  }

  function extractVisible() {
    const msgElements = document.querySelectorAll('[id^="chat-messages-"]');
    msgElements.forEach(el => {
      const id = el.id;
      if (allMessages.has(id)) return;

      const timeEl = el.querySelector('time');
      const timestamp = timeEl ? timeEl.getAttribute('datetime') : null;

      const authorEl = el.querySelector('[class*="username_"]')
                    || el.querySelector('[class*="headerText_"] span');
      const author = authorEl ? authorEl.textContent.trim() : '__continued__';

      const contentEl = el.querySelector('[id^="message-content-"]');
      const content = contentEl ? contentEl.innerText.trim() : '';

      const linkEls = contentEl ? contentEl.querySelectorAll('a[href]') : [];
      const links = Array.from(linkEls).map(a => a.href);

      const embedLinkEls = el.querySelectorAll('[class*="embed_"] a[href]');
      const embedLinks = Array.from(embedLinkEls)
        .map(a => a.href)
        .filter(href => !links.includes(href));

      const embedTextEls = el.querySelectorAll('[class*="embedTitle_"], [class*="embedDescription_"]');
      const embedText = Array.from(embedTextEls).map(e => e.innerText.trim()).filter(Boolean);

      const imgEls = el.querySelectorAll(
        '[class*="imageWrapper_"] img, ' +
        '[class*="embedImage_"] img, ' +
        '[class*="attachment_"] img, ' +
        'img[src*="attachments/"], ' +
        'img[src*="cdn.discordapp.com"]'
      );
      const images = [];
      const seen = new Set();
      imgEls.forEach(img => {
        let src = img.closest('a') ? img.closest('a').href : (img.src || '');
        try {
          const u = new URL(src);
          u.searchParams.delete('width');
          u.searchParams.delete('height');
          u.searchParams.delete('size');
          src = u.toString();
        } catch (_) {}
        if (src && !seen.has(src) && !src.startsWith('data:') && !isJunkImage(src)) {
          seen.add(src);
          images.push(src);
          imageURLs.push(src);
        }
      });

      const videoEls = el.querySelectorAll('video source, [class*="attachment_"] a[href*=".mp4"], a[href*=".webm"]');
      const videos = Array.from(new Set(
        Array.from(videoEls).map(v => v.src || v.href).filter(Boolean)
      ));

      const fileEls = el.querySelectorAll('[class*="attachment_"] a[href*="cdn.discordapp.com"]');
      const files = Array.from(fileEls)
        .map(a => a.href)
        .filter(href => {
          const lower = href.toLowerCase();
          return !lower.match(/\.(png|jpg|jpeg|gif|webp|mp4|webm|mov)(\?|$)/);
        });

      allMessages.set(id, {
        id,
        timestamp: timestamp || '',
        author,
        content,
        links,
        embedLinks,
        embedText,
        images,
        videos,
        files,
      });
    });
  }

  // --- SCROLL UP AND COLLECT ---
  let staleCount = 0;
  const maxStale = 15;
  console.log('%c[Discord Scraper] Starting — scrolling to top...', 'color: cyan; font-weight: bold');

  while (staleCount < maxStale) {
    const prevSize = allMessages.size;
    extractVisible();
    scroller.scrollTo({ top: 0, behavior: 'instant' });
    await new Promise(r => setTimeout(r, 2500));
    extractVisible();

    if (allMessages.size === prevSize) {
      staleCount++;
      console.log(`[Discord Scraper] No new messages (${staleCount}/${maxStale})... ${allMessages.size} total`);
    } else {
      staleCount = 0;
      console.log(`[Discord Scraper] ${allMessages.size} messages collected`);
    }
  }

  extractVisible();
  console.log('%c[Discord Scraper] Scrolling complete.', 'color: lime; font-weight: bold');

  // --- BACKFILL AUTHORS FOR GROUPED MESSAGES ---
  const sorted = Array.from(allMessages.values())
    .sort((a, b) => {
      if (a.timestamp && b.timestamp) return new Date(a.timestamp) - new Date(b.timestamp);
      return a.id.localeCompare(b.id);
    });

  let lastAuthor = '';
  let lastTimestamp = '';
  for (const msg of sorted) {
    if (msg.author === '__continued__') {
      msg.author = lastAuthor;
    } else {
      lastAuthor = msg.author;
    }
    if (!msg.timestamp && lastTimestamp) {
      msg.timestamp = lastTimestamp;
    } else if (msg.timestamp) {
      lastTimestamp = msg.timestamp;
    }
  }

  sorted.forEach(m => delete m.id);

  // --- STATS ---
  const stats = {
    totalMessages: sorted.length,
    uniqueAuthors: [...new Set(sorted.map(m => m.author))],
    totalImages: imageURLs.length,
    dateRange: sorted.length
      ? `${sorted[0].timestamp} → ${sorted[sorted.length - 1].timestamp}`
      : 'N/A',
  };
  console.log('%c[Discord Scraper] Stats:', 'color: yellow; font-weight: bold', stats);

  // --- DOWNLOAD JSON ---
  const output = { stats, messages: sorted };
  const blob = new Blob([JSON.stringify(output, null, 2)], { type: 'application/json' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = `discord-export-${new Date().toISOString().slice(0, 10)}.json`;
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  URL.revokeObjectURL(url);
  console.log('%c[Discord Scraper] JSON downloaded!', 'color: lime; font-weight: bold');

  // --- DOWNLOAD IMAGES (skip junk < 10KB) ---
  if (imageURLs.length > 0) {
    const downloadImages = confirm(
      `Found ${imageURLs.length} images. Download them all?\n\n` +
      `(Tiny images < 10KB like emoji will be auto-skipped.\n` +
      `They'll save as individual files via your browser's download manager.)`
    );
    if (downloadImages) {
      let skipped = 0;
      let downloaded = 0;
      const MIN_SIZE = 10 * 1024; // 10KB minimum — skip emoji/icons
      console.log(`[Discord Scraper] Downloading ${imageURLs.length} images (skipping < ${MIN_SIZE/1024}KB)...`);
      for (let i = 0; i < imageURLs.length; i++) {
        const imgUrl = imageURLs[i];
        try {
          const resp = await fetch(imgUrl);
          const imgBlob = await resp.blob();
          if (imgBlob.size < MIN_SIZE) {
            skipped++;
            console.log(`[Discord Scraper] Skipped tiny image (${imgBlob.size}B): ${imgUrl.slice(0, 80)}`);
            continue;
          }
          const ext = imgUrl.match(/\.(png|jpg|jpeg|gif|webp)/i)?.[1] || 'png';
          const imgA = document.createElement('a');
          imgA.href = URL.createObjectURL(imgBlob);
          imgA.download = `discord-img-${String(downloaded + 1).padStart(4, '0')}.${ext}`;
          document.body.appendChild(imgA);
          imgA.click();
          document.body.removeChild(imgA);
          URL.revokeObjectURL(imgA.href);
          downloaded++;
          if (downloaded % 5 === 0) await new Promise(r => setTimeout(r, 500));
        } catch (err) {
          console.warn(`[Discord Scraper] Failed to download image ${i + 1}: ${imgUrl}`, err);
        }
      }
      console.log(`%c[Discord Scraper] Done! ${downloaded} downloaded, ${skipped} tiny images skipped.`, 'color: lime; font-weight: bold');
    }
  }

  console.log('%c[Discord Scraper] All done!', 'color: lime; font-size: 16px; font-weight: bold');
  return output;
})();
