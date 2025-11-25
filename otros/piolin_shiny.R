
library(shiny)

temporal <- tempfile()
filename <- system.file("img", piolín, temporal)

imagen <- div(style = "width: 60%; margin: auto;",
    img(src = piolín)
)

temporal <- tempfile(fileext = ".html")

writeLines(text = as.character(imagen), 
           temporal)


rstudioapi::viewer(temporal)
