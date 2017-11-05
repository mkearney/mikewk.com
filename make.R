
## mikewk.com

## read in my blogdown/hugo helper funs
source(".funs.R")

## create new post template
new_post(
  "readChar.R",
  categories = "R",
  tags = c("readChar", "rstats"),
  date = "2017-11-03"
)

## serve site
x <- blogdown:::serve_site()

## stop server (or restart R session)
servr::daemon_stop(x)

## rm these damn things
rm_.DS_Store()

add_to_git("edited new_post funs and blog post organization")
