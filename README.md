# color-blindness-app
Aplicación móvil que permite a las personas con algún tipo de Daltonismo modificar las fotos e imágenes para una mejor visualización.

### ¿Qué es el Daltonismo?
El daltonismo es la incapacidad para ver algunos colores en la forma normal. Este ocurre cuando hay un problema con los pigmentos en ciertas células nerviosas del ojo que perciben el color. Estas células se llaman conos y se encuentran en la capa de tejido sensible a la luz que recubre la parte posterior del ojo, llamada la retina (1).
### Los distintos tipos
Su clasificación puede darse por la cantidad de tipos de pigmentos afectados. Además, existe una diferenciación dependiendo de la familia de conos afectada.

|Nombre|Descripción|
|-----------|---------------|
|**Acromático**|El individuo ve en blanco y negro (escala de gris). El individuo no percibe ningún color ya sea porque no tiene ninguno de los tres tipos de conos o por razones neurológicas. |
|**Monocromático**|Se presenta cuando únicamente existe uno de los tres pigmentos de los conos y la visión de la luz y el color queda reducida a una dimensión. |
|**Dicromático**| Falta o padece una disfunción de uno de los tres mecanismos básicos del color. Es hereditaria y puede ser de tres tipos diferentes: Protanopia, deuteranopia y tritanopia|
|**Tricromático anómalo**| El afectado posee los tres tipos de conos, pero con defectos funcionales, por lo que confunde un color con otro. Es el grupo más abundante y común de daltónicos, tienen tres tipos de conos, pero perciben los tonos de los colores alterados. Suelen tener defectos similares a los daltónicos dicromáticos, pero menos notables|

_Tabla 1: Tipos de Daltonismo por tipos de pigmentos visibles(2)_


#### TIPOS DE DALTONISMO DICROMÁTICO

|Nombre|Descripción|
|-------------|---------------|
|**Protanopia**| Es la ausencia total de los fotorreceptores retinianos del rojo|
|**Deuteranopia**| Es la ausencia de los fotorreceptores retinianos del color verde|
|**Tritanopia**| Están ausentes los fotorreceptores de la retina para el color azul|

_Tabla 2: Tipos de Daltonismo Dicromático(2)_

![image](https://user-images.githubusercontent.com/20799456/53156257-fe522280-358c-11e9-96a6-df7e38c26ffb.png)
 
_Imagen 1: Tipos de Daltonismo Dicromático(2)_

### ¿Posibles soluciones?
Teniendo en cuenta lo anterior para lograr una aplicación accesible a personas con algún tipo de ceguera al color, debemos tener en cuenta que podemos realizar distintos tipos de abordaje. Podemos cambiar las imágenes píxel por píxel o aplicar algún tipo de filtro, así, facilitar la diferenciación de colores o cambiar el color que no es detectado por uno dentro del espectro percibible.

Si tenemos pensado cambiar el color afectado por otro debemos tener en cuenta que hay un conjunto de combinaciones de colores que deben evitarse, ya que puede ser difícil para una persona ciega del color diferenciarlas:

|||||
|----|-----|----|-----|
|rojo y verde|rojo y marrón|rojo y naranja|rojo y violeta|
|rojo y negro|verde y marrón|verde y naranja|verde claro y amarillo|
|azul y verde|azul y morado|azul y amarillo|

_Tabla 3: Combinaciones de colores óptimas(3)_

### Solución propuesta
El problema generalmente surge cuando un diseño se basa en colores que tienen niveles de matiz, saturación o brillo cercanos, haciéndolos parecer sombras del mismo color (3). De aquí, que la segunda opción es modificar estos valores para acercarlos a un color vivible del espectro.
Para esta solución se hizo uso de la propiedad _blend mode_ que ofrece _Flutter_ en widgets de tipo imagen. En consecuencia, se crearon dos tipos de filtros, usando como color de fuente los tipos de pigmentos de los conos. Posteriormente se aplicaron dos _blend modes_ para modificar el matiz y la saturación.

|Blend mode|Descripción|
|----------------|-----------------|
|**saturation**|Toma la saturación de la imagen de origen y el tono y la luminosidad de la imagen de destino.|
|**hue**|Toma el tono de la imagen de origen y la saturación y luminosidad de la imagen de destino. El efecto es teñir la imagen de destino con la imagen de origen.|

_Tabla 4: Blend modes usados en la solución propuesta (4)_

### REFERENCIAS

1. [Daltonismo: MedlinePlus enciclopedia médica](https://medlineplus.gov/spanish/ency/article/001002.htm)

2. [Daltonismo - Clínica Rementería](http://www.clinicarementeria.es/patologias/daltonismo)

3. [Creating Graphic Design and Illustration for Color Blind People](https://design.tutsplus.com/articles/design-and-illustration-for-the-color-blind--cms-30201)

4. [ BlendMode enum - dart:ui library - Dart API](https://docs.flutter.io/flutter/dart-ui/BlendMode-class.html)
