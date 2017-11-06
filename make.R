
## mikewk.com

## read in my blogdown/hugo helper funs
source(".funs.R")

## create new post template
new_post(
  "Suspicious accounts continue to influence news about Trump adminstration",
  categories = "politics",
  tags = c("trump", "bots")
)

## serve site
x <- blogdown:::serve_site()

## stop server (or restart R session)
servr::daemon_stop(x)

## rm these damn things
rm_.DS_Store()

add_to_git("new blog post")
1
