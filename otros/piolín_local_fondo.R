library(magick)

piolines <- list.files("imágenes", full.names = TRUE)

piolín <- sample(piolines, 1)

figura <- piolín |> 
  image_read() |> 
  image_resize(300)

tamaño <- grDevices::dev.size("px")/2

fondo <- image_blank(width = tamaño[1], 
                     height = tamaño[2], 
                     color = "#181818")

salida <- image_composite(fondo, 
                          figura, 
                          gravity = "center")

print(salida, info = FALSE)
