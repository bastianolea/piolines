library(shiny)

# opciones
saludito <- "piolín"
tamaño <- "70%"
fondo <- "#181818"

# escoger imagen
if (saludito %in% c("gato", "gatos", "cats")) {
  # gatos
  imagen <- "https://cataas.com/cat"
  
} else if (saludito %in% c("piolín", "piolin", "piolines")) {
  # piolines
  imagen <- paste0("https://raw.githubusercontent.com/bastianolea/piolines/master/img/piolin_", 1:20, ".jpg") |> 
    sample(1)
}

# crear página en html
imagen <- tags$body(
  style = paste("background-color:", fondo, "; display: flex; justify-content: center;"),
  img(src = imagen, style = paste("max-height:", tamaño, "; margin: auto;"))
)

# crear archivo temporal
temporal <- tempfile(fileext = ".html")

# escribir la página al archivo temporal
writeLines(text = as.character(imagen), temporal)

# ver en Rstudio
rstudioapi::viewer(temporal)

# limpieza
rm(temporal, imagen, fondo, tamaño, saludito)