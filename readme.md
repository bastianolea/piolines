

## Saluditos

Código e instrucciones para tener imágenes de saludo al inciar RStudio.

Opciones 
- Bendiciones (piolín)
- Gatitos via [Cats As a Service](https://cataas.com/)

### Instrucciones

Editar el `.RProfile` con:

```r
usethis::edit_r_profile()
```

Poner esto dentro del `.RProfile`:
```r
# copiar esto y ponerlo en el .RProfile
setHook("rstudio.sessionInit", function(newSession) {
  
  ###
  # aquí
  ###
  
}, action = "append")
```

Luego poner dentro de lo anterior (donde dice _aquí_) el código de uno de los scripts:
- `piolín_remoto.R`
- `gato_remoto.R`
Puedes ejecutar los scripts para previsualizar su resultado, y ajustar las opciones si deseas.

El contenido del `.RProfile` quedaría así:

```r
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
```
