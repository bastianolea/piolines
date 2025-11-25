# cargar/instalar paquete
if(!require(magick)) {
  install.packages("magick")
  library(magick)
}

fondo = "#181818" # color del fondo
porcentaje = 0.4 # tamaño de la imagen

piolines <- c("https://cdn.pensador.com/es/imagenes/buenos-dias-con.jpg",
              "https://cdn.pensador.com/es/imagenes/que-tu-cafe-este.jpg",
              "https://cdn.pensador.com/es/imagenes/hoy-es-un-buen-dia.jpg")

piolín <- sample(piolines, 1)

# obtener tamaño del panel
tamaño <- dev.size("px")/2

# achicar imagen
imagen <- image_read(piolín) |> image_resize(tamaño*porcentaje)

# crear fondo
fondo <- image_blank(width = tamaño[1], height = tamaño[2], color = fondo)

# unir imagen y fondo
salida <- image_composite(fondo, imagen, gravity = "center")

print(salida, info = FALSE)
