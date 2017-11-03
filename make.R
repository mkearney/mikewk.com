
## mikewk.com

## serve site
x <- blogdown:::serve_site()

## stop server (or restart R session)
servr::daemon_stop(x)

## read in my blogdown/hugo helper funs
source(".funs.R")

## rm these damn things
rm_.DS_Store()

## create new post template
new_post("R", categories = "R", tags = c("cran", "rstudio", "rstats"))
