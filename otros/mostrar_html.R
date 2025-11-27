contenido <- tags$body(
  style = "background-color: #181818; display: flex; justify-content: center;",
  p("Hola", style = "color: #DDD5DE; font-size: 48px; font-family: 'Arial';")
)

# crear archivo temporal
temporal <- tempfile(fileext = ".html")

# escribir la página al archivo temporal
writeLines(text = as.character(contenido), temporal)

# ver en Rstudio
rstudioapi::viewer(temporal)