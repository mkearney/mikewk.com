## mikewk.com

## build site
blogdown::build_site()

## serve site
x <- blogdown:::serve_site()

## stop server (or restart R session)
servr::daemon_stop(x)

## rm these damn things
rm_.DS_Store()

tfse::add_to_git("edit fonts")
1
