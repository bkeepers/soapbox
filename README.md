# Soapbox

_Note: this README is aspirational. Assume none of this works yet._

Soapbox is a desktop application for presenting HTML-based slideshows.

Features:

- Open any HTML-based slideshow from a URL or local file.
- Full screen presenter mode with dual-screen support
- Offline caching of all presentation assets
- Built-in support for Markdown-based slideshows using [remark][]
- Works on Mac, Windows, and Linux

## Markdown

If a markdown file is opened, it is assumed to be a presentation built with [remark][].

```markdown
# remark

.footnote[Go directly to [project site](https://github.com/gnab/remark)]

---

## What is it and why should I be using it?

---

.left-column[
  ## What is it?
]

.right-column[
  A simple, in-browser, Markdown-driven slideshow tool targeted at people who know their way around HTML and CSS, featuring:

- Markdown formatting, with smart extensions

- Presenter mode, with cloned slideshow view

- Syntax highlighting, supporting a range of languages

- Slide scaling, thus similar appearance on all devices / resolutions .red[*]

- Touch support for smart phones and pads, i.e. swipe to navigate slides

.footnote[.red[*] At least browsers try their best]
]
```

[remark]: https://github.com/gnab/remark
