# Discord Grabber — Raymo Skill

Browser console JavaScript tool that extracts full conversation history from the Discord web app. Scrolls to the beginning of a channel/DM, captures every message incrementally (because Discord unloads messages as you scroll away), and exports as chronological JSON with images, links, embeds, and file attachments.

## Why This Exists

Discord does not provide a user-facing export. Messages are lazy-loaded and virtualized — you can't just scroll to the top and `querySelectorAll`. This script solves that by collecting messages at each scroll position into a deduplicated Map before scrolling further.

## Finding the Scroller Element

Discord obfuscates class names. Run this diagnostic first:

```javascript
document.querySelectorAll('*').forEach(el => {
  if (el.scrollHeight > el.clientHeight + 100 && el.clientHeight > 200) {
    console.log('Scrollable:', el.scrollHeight, el.tagName, el.className.slice(0, 80), el);
  }
});
```

The message scroller is typically the one with `managedReactiveScroller` in the class, or `role="group"` + `data-jump-section="global"`.

## Selector Reference (as of March 2026)

| Data | Selector |
|------|----------|
| Scroller | `[class*="managedReactiveScroller"]` or `[data-jump-section="global"][role="group"]` |
| Message block | `[id^="chat-messages-"]` |
| Timestamp | `time[datetime]` (ISO 8601) |
| Author | `[class*="username_"]` or `[class*="headerText_"] span` |
| Content | `[id^="message-content-"]` (use `.innerText`) |
| Images | `[class*="imageWrapper_"] img`, `img[src*="attachments/"]`, `img[src*="cdn.discordapp.com"]` |
| Embeds | `[class*="embed_"] a[href]`, `[class*="embedTitle_"]`, `[class*="embedDescription_"]` |
| Videos | `video source`, `a[href*=".mp4"]`, `a[href*=".webm"]` |
| Files | `[class*="attachment_"] a[href*="cdn.discordapp.com"]` (exclude image/video extensions) |

## Key Techniques

- **Scroll method**: `scroller.scrollTo({ top: 0, behavior: 'instant' })` — not `scrollTop = 0`
- **Grouped messages**: Discord omits author/timestamp on consecutive same-author messages. Backfill by iterating sorted results.
- **Full-res images**: Strip `width`, `height`, `size` query params from CDN URLs.
- **Stale detection**: 15 consecutive scroll cycles with no new messages = reached the top.
- **Timing**: 2500ms between cycles. Increase to 3000-4000ms for very long channels.

## Complete Script

See `discord-grabber.js` for the standalone file. The script is also embedded in the Claude Code skill at `~/.claude/skills/discord-grabber/skill.md`.

### Junk Image Filtering

The script filters out junk images at two levels:
1. **URL filter** — skips known junk patterns before collection: `cdn.discordapp.com/emojis/`, `/avatars/`, `/clan-badges/`, `/stickers/`, twemoji
2. **Size filter** — at download time, skips any image < 10KB (emoji are ~495 bytes, real photos are 50KB+)

## Raymo Integration

Raymo can use exported Discord JSON as context for agent work. The JSON output contains structured messages with timestamps, making it suitable for:
- Building conversation timelines for PR context
- Extracting action items from Discord discussions
- Feeding into Raymo's knowledge system for agent prompts
- Archiving Discord channels that inform Ray Browser development decisions
