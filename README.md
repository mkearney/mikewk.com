# mikewk.com

Source for [mikewk.com](https://mikewk.com), the personal website of Michael W. Kearney.

The site is built with [Hugo](https://gohugo.io) and published by GitHub Pages from the
`docs/` folder on the default branch. Templates live in `layouts/` (no external theme is needed).

## Layout

| Path | What's there |
| --- | --- |
| `config.toml` | Site settings: menu, sidebar subtitle, social links |
| `content/` | Pages (`about.md`, `publications.md`) and blog posts (`post/`) |
| `layouts/` | Hugo templates |
| `static/` | CSS, fonts, images, JS, and PDFs, copied as-is |
| `docs/` | The built site (generated; don't edit by hand) |

Blog posts are written in R Markdown (`.Rmd`) and rendered to `.html` with
[blogdown](https://github.com/rstudio/blogdown). Hugo only reads the rendered `.html`.

## Working on the site

```sh
make serve   # live preview at http://localhost:1313
make build   # regenerate docs/, then commit it
make rmd     # re-knit changed R Markdown posts (needs R + blogdown)
```

To add a publication, edit `content/publications.md`. To change social links or the
sidebar text, edit `[params]` in `config.toml`.
