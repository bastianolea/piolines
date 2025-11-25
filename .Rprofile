
setHook("rstudio.sessionInit", function(newSession) {
  if (newSession) {
    
    # cargar/instalar paquete
    if (require(magick)) { 
      library(magick)
    } else {
      install.packages("magick")
      library(magick)
    }
    
    # opciones
    fondo = "#181818" # color del fondo
    porcentaje = 0.4 # tamaño de la imagen
    
    # elegir imagen
    piolines <- list.files("imágenes", full.names = TRUE)
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
    
    
  }
}, action = "append")
