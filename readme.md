## Saluditos

Código para que te aparezcan imágenes al azar cuando abras RStudio.

**Opciones:**
- Bendiciones de piolín
- Gatitos mediante la API [Cats As a Service](https://cataas.com/)

![](otros/pantallazo.png)


### Instrucciones

Para hacer que aparezcan los saludos hay que editar el `.RProfile`, que es un script especial que se ejecuta automáticamente al abrir R. [Más información aquí.](https://bastianolea.rbind.io/blog/2025-11-25/)

Edita tu `.RProfile` ejecutando:

```r
usethis::edit_r_profile()
```

Se abrirá un script. Pon esto dentro del `.RProfile`:

```r
# copiar esto y ponerlo en el .RProfile
setHook("rstudio.sessionInit", function(newSession) {
  
  ###
  # aquí
  ###
  
}, action = "append")
```

Luego, pon dentro de lo anterior (donde dice _aquí_) el código del script `saludito.R`.

En la parte de `opciones`, puedes elegir entre `gatos` o `piolín`.

Puedes ejecutar el script `saludito.R` para previsualizar su resultado, y ajustar las opciones si deseas.

Requiere que tengas instalado [Shiny](https://shiny.posit.co). Instálalo con `install.packages("shiny")` si no lo tienes.

El contenido del `.RProfile` quedaría así (puedes copiarlo y pegarlo todo para ahorrarte tiempo):

```r
setHook("rstudio.sessionInit", function(newSession) {
  if (newSession) {
    
    # opciones
    saludito <- "gatos" # gatos o piolín
    tamaño <- "70%"
    fondo <- "#181818"
    
    # escoger imagen
    if (saludito == "gatos") {
      imagen <- "https://cataas.com/cat"
      
    } else if (saludito == "piolín") {
      imagen <- paste0("https://raw.githubusercontent.com/bastianolea/piolines/master/img/piolin_", 1:20, ".jpg") |> sample(1)
    }
    
    # crear página en html
    library(shiny)
    imagen <- tags$body(
      style = paste("background-color:", fondo, "; display: flex; justify-content: center;"),
      img(src = imagen, style = paste("max-height:", tamaño, "; margin: auto;")))
    
    temporal <- tempfile(fileext = ".html") # crear archivo temporal
    
    writeLines(text = as.character(imagen), temporal) # guardar la página al archivo temporal
    
    rstudioapi::viewer(temporal) # ver archivo temporal en Rstudio
    
    rm(temporal, imagen, fondo, tamaño, saludito) # limpieza
    
  }
}, action = "append")
```

Ahora cuando abras RStudio aparecerá una imagen al azar!

Que tengas un bello y bendecido día 🌸✨


