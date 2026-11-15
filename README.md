# mikewk.com

Source for [mikewk.com](https://mikewk.com), the personal website of Michael W. Kearney.

The site is built with [Hugo](https://gohugo.io) and published by GitHub Pages from the
`docs/` folder on the default branch. Templates live in `layouts/` (no external theme is needed).

## Layout

| Path | What's there |
| --- | --- |
| `config.toml` | Site settings: menu, sidebar subtitle, social links |
| `content/` | Home page intro (`_index.md`), pages (`about.md`, `projects.md`), and blog posts (`post/`) |
| `data/projects.toml` | Project cards shown on the home page and /projects/ |
| `layouts/` | Hugo templates |
| `assets/` | Stylesheet (`css/main.css`) and script, minified and fingerprinted at build time |
| `static/` | Images, PDFs, and other files copied as-is |
| `docs/` | The built site (generated; don't edit by hand) |

Older blog posts are written in R Markdown (`.Rmd`) and rendered to `.html` with
[blogdown](https://github.com/rstudio/blogdown). Hugo only reads the rendered `.html`.

## Working on the site

```sh
make serve   # live preview at http://localhost:1313
make build   # regenerate docs/, then commit it
make rmd     # re-knit changed R Markdown posts (needs R + blogdown)
```

To add or reorder projects, edit `data/projects.toml`. New posts can be plain Markdown in a
folder (`content/post/YYYY-MM-DD-slug/index.md`) with their images next to them; images are
resized at build time. To change the intro on the home
page, edit `content/_index.md`; the role, focus areas, and footer links live under `[params]`
in `config.toml`. Colors and fonts are CSS variables at the top of `assets/css/main.css`
(with matching dark-mode values).
