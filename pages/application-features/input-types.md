---
title: Tipos de entrada compatibles con AppGini
linkTitle: Tipos de entrada
slug: help/application-features/input-types
description: Obtenga información sobre los diferentes tipos de entrada compatibles con AppGini y cómo crear campos de cada tipo.
keywords: tipos de entrada, cuadro de texto, área de texto, área enriquecida, casilla de verificación, botones de opción, lista desplegable, lista de selección múltiple, fecha, fecha y hora, hora, carga de archivos, carga de imágenes, mapa de Google, video de YouTube, solo lectura
---

# Tipos de entrada compatibles con AppGini

AppGini admite una variedad de tipos de entrada para los campos de sus tablas. Esta página enumera los tipos de entrada admitidos y proporciona una breve descripción de cada uno.
La siguiente captura de pantalla muestra un formulario de vista detallada de ejemplo con campos de diferentes tipos de entrada:

![Formulario de vista detallada de ejemplo con campos de diferentes tipos de entrada](https://cdn.bigprof.com/images/input-types-dv-3-col.png "Formulario de vista detallada de ejemplo con campos de diferentes tipos de entrada")

Y esta captura de pantalla muestra la vista de tabla correspondiente:

![Vista de tabla de ejemplo con campos de diferentes tipos de entrada](https://cdn.bigprof.com/images/input-types-tv.png "Vista de tabla de ejemplo con campos de diferentes tipos de entrada")

Repasemos ahora los tipos de entrada admitidos.

## Cuadro de texto

Este es el tipo de entrada más común. Permite a los usuarios ingresar texto, números o cualquier otro dato. Aquí hay una captura de pantalla de un campo de cuadro de texto en un formulario de vista detallada:

![Campo de cuadro de texto en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-textbox.png "Campo de cuadro de texto en un formulario de vista detallada")

Y aquí hay una captura de pantalla de un campo de cuadro de texto en una vista de tabla:

![Campo de cuadro de texto en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-textbox.png "Campo de cuadro de texto en una vista de tabla")

Para crear un campo de cuadro de texto, establezca el tipo de datos de su campo en `Char`, `Varchar` o cualquier tipo numérico.
Para los campos `Char` y `Varchar`, puede especificar la longitud máxima del texto que se puede ingresar en el campo.

## Área de texto

Este tipo de entrada es similar al cuadro de texto, pero permite a los usuarios ingresar varias líneas de texto. Aquí hay una captura de pantalla de un campo de área de texto en un formulario de vista detallada:

![Campo de área de texto en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-textarea.png "Campo de área de texto en un formulario de vista detallada")

Y aquí hay una captura de pantalla de un campo de área de texto en una vista de tabla:

![Campo de área de texto en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-textarea.png "Campo de área de texto en una vista de tabla")

Para crear un campo de área de texto, establezca el tipo de datos de su campo en `Text`, `Tiny text`, `Medium text` o `Long text`, y marque la casilla de verificación **Área de texto** en las propiedades del campo.

> **Nota**: También podría usar el tipo de datos `Blob` y sus variantes para almacenar datos de texto grandes, pero esto no se recomienda para datos de texto, ya que es menos eficiente que usar los tipos de datos `Text`.

## Área enriquecida (HTML)

Este tipo de entrada permite a los usuarios ingresar texto enriquecido, incluido texto formateado, imágenes, enlaces, etc. Aquí hay una captura de pantalla de un campo de área enriquecida en un formulario de vista detallada:

![Campo de área enriquecida en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-richtext.png "Campo de área enriquecida en un formulario de vista detallada")

Y aquí hay una captura de pantalla de un campo de área enriquecida en una vista de tabla:

![Campo de área enriquecida en una vista de tabla](https://cdn.bigprof.com/images/input-types-rich-html-area.png "Campo de área enriquecida en una vista de tabla")

Para crear un campo de área enriquecida, establezca el tipo de datos de su campo en `Text`, `Tiny text`, `Medium text` o `Long text`, y marque la casilla de verificación **Área enriquecida (HTML)** en las propiedades del campo.

***CONSEJO:*** Si nombra su campo `description`, `comments`, `notes` o `details`, AppGini establecerá automáticamente el tipo de datos en `Text` y marcará la casilla de verificación **Área enriquecida (HTML)** por usted.

## Casilla de verificación

Este tipo de entrada permite a los usuarios marcar o desmarcar una casilla. El texto que se muestra junto a la casilla de verificación se puede personalizar configurando la propiedad **Título** del campo.
Aquí hay una captura de pantalla de un campo de casilla de verificación en un formulario de vista detallada:

![Campo de casilla de verificación en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-checkbox.png "Campo de casilla de verificación en un formulario de vista detallada")

Y aquí hay una captura de pantalla de un campo de casilla de verificación marcado en una vista de tabla:

![Campo de casilla de verificación marcado en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-checkbox.png "Campo de casilla de verificación marcado en una vista de tabla")

Para crear un campo de casilla de verificación, marque la opción **Casilla de verificación** en las propiedades del campo.

## Botones de opción

Este tipo de entrada permite a los usuarios seleccionar una opción de una lista de opciones.
Aquí hay una captura de pantalla de un campo de botones de opción en un formulario de vista detallada:

![Campo de botones de opción en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-radio-buttons.png "Campo de botones de opción en un formulario de vista detallada")

Y aquí hay una captura de pantalla de un campo de botones de opción en una vista de tabla:

![Campo de botones de opción en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-radio-buttons.png "Campo de botones de opción en una vista de tabla")

Los botones de opción se pueden crear de dos maneras:

1. En la pestaña **Lista de opciones** de las propiedades del campo, ingrese las opciones que desea mostrar como botones de opción en el cuadro **Valores de la lista**, separadas por dos puntos y coma (`;;`).
   Por ejemplo, para crear un campo de botones de opción con las opciones `Sí` y `No`, ingrese `Sí;;No` en el cuadro **Valores de la lista**. Debajo del cuadro **Valores de la lista**,
   elija la opción **Botones de opción** de la propiedad **Mostrar las opciones como**.

     **Sugerencia:** El menú desplegable **Lista rápida** a la derecha del cuadro **Valores de la lista** le permite agregar rápidamente opciones comunes como meses, días de la semana, estados de EE. UU., etc.

2. Si tiene una tabla en su proyecto que contiene las opciones que desea mostrar como botones de opción, puede vincular el campo a esa tabla.
   Para hacer esto, vaya a la pestaña **Campo de búsqueda** en las propiedades del campo y seleccione la tabla principal y el campo que contiene las opciones que desea mostrar como botones de opción.
   Luego, marque la opción **Mostrar como botones de opción**.

   Tenga en cuenta que este método no es adecuado para tablas grandes, ya que cargará todos los registros de la tabla principal para mostrar los botones de opción,
   lo que puede resultar en un formulario enorme, así como problemas de rendimiento.

## Lista desplegable

Este tipo de entrada permite a los usuarios seleccionar una opción de una lista de opciones. La lista de opciones puede ser estática (ingresada manualmente dentro de AppGini) o dinámica (obtenida de una tabla en su aplicación).
Aquí hay una captura de pantalla de un campo de lista desplegable cerrado en un formulario de vista detallada:

![Campo de lista desplegable en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-drop-down-closed.png "Campo de lista desplegable en un formulario de vista detallada")

Y aquí hay una captura de pantalla de un campo de lista desplegable abierto en un formulario de vista detallada:

![Campo de lista desplegable en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-drop-down-open.png "Campo de lista desplegable en un formulario de vista detallada")

Y así es como se ve el campo de lista desplegable en una vista de tabla:

![Campo de lista desplegable en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-drop-down.png "Campo de lista desplegable en una vista de tabla")

Los campos de lista desplegable se pueden crear de dos maneras:

1. En la pestaña **Lista de opciones** de las propiedades del campo, ingrese las opciones que desea mostrar en la lista desplegable en el cuadro **Valores de la lista**, separadas por dos puntos y coma (`;;`).
   Por ejemplo, para crear un campo de lista desplegable con las opciones `Sí` y `No`, ingrese `Sí;;No` en el cuadro **Valores de la lista**. Debajo del cuadro **Valores de la lista**,
   elija la opción **Lista desplegable** de la propiedad **Mostrar las opciones como**.

     **Sugerencia:** El menú desplegable **Lista rápida** a la derecha del cuadro **Valores de la lista** le permite agregar rápidamente opciones comunes como meses, días de la semana, estados de EE. UU., etc.

2. Si tiene una tabla en su proyecto que contiene las opciones que desea mostrar en la lista desplegable, puede vincular el campo a esa tabla.
   Para hacer esto, vaya a la pestaña **Campo de búsqueda** en las propiedades del campo y seleccione la tabla principal y el campo que contiene las opciones que desea mostrar en la lista desplegable.

Si la lista desplegable contiene más de unas pocas opciones, se mostrará un cuadro de búsqueda en la parte superior de la lista para ayudar a los usuarios a encontrar rápidamente la opción deseada.

## Lista de selección múltiple

Este tipo de entrada permite a los usuarios seleccionar múltiples opciones de una lista de opciones.
Aquí hay una captura de pantalla de un campo de lista de selección múltiple cerrado en un formulario de vista detallada:

![Campo de lista de selección múltiple en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-multiple-choice-drop-down-closed.png "Campo de lista de selección múltiple en un formulario de vista detallada")

Y aquí hay una captura de pantalla de un campo de lista de selección múltiple abierto en un formulario de vista detallada:

![Campo de lista de selección múltiple en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-multiple-choice-drop-down-open.png "Campo de lista de selección múltiple en un formulario de vista detallada")

Y así es como se ve el campo de lista de selección múltiple en una vista de tabla:

![Campo de lista de selección múltiple en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-multiple-choice-drop-down.png "Campo de lista de selección múltiple en una vista de tabla")

Los campos de lista de selección múltiple se pueden crear en la pestaña **Lista de opciones** de las propiedades del campo. Ingrese
las opciones que desea mostrar en la lista de selección múltiple en el cuadro **Valores de la lista**, separadas por dos puntos y coma (`;;`).
Asegúrese de que el tipo de datos del campo esté configurado en `Text` (o cualquiera de sus variantes).

## Fecha

Este tipo de entrada permite a los usuarios seleccionar una fecha de un calendario. Aquí hay una captura de pantalla de un campo de fecha en un formulario de vista detallada:

![Campo de fecha en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-date-pickup-closed.png "Campo de fecha en un formulario de vista detallada")

Y aquí hay una captura de pantalla del selector de fechas en estado abierto:

![Campo de fecha en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-date-pickup-open.png?2 "Campo de fecha en un formulario de vista detallada")

Y así es como se ve el campo de fecha en una vista de tabla:

![Campo de fecha en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-date.png)

Para crear un campo de fecha, establezca el tipo de datos de su campo en `Date`. Si nombra un campo
cualquier cosa que termine con `date`, se establecerá automáticamente en el tipo de datos `Date`.

Para establecer el formato de fecha, puede hacerlo en **Configuración de localización** en las propiedades del proyecto.

## Fecha y hora

Este tipo de entrada permite a los usuarios seleccionar una fecha y hora de un calendario. Aquí hay una captura de pantalla de un campo de fecha y hora en un formulario de vista detallada:

![Campo de fecha y hora en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-datetime-pickup-closed.png "Campo de fecha y hora en un formulario de vista detallada")

Y aquí hay una captura de pantalla del selector de fecha y hora en estado abierto:

![Campo de fecha y hora en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-datetime-pickup-open.png "Campo de fecha y hora en un formulario de vista detallada")

Y así es como se ve el campo de fecha y hora en una vista de tabla:

![Campo de fecha y hora en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-datetime.png "Campo de fecha y hora en una vista de tabla")

Para crear un campo de fecha y hora, establezca el tipo de datos de su campo en `Datetime`.

Para establecer el formato de fecha y hora, puede hacerlo en **Configuración de localización** en las propiedades del proyecto.

## Hora

Este tipo de entrada permite a los usuarios seleccionar una hora de una lista desplegable. Aquí hay una captura de pantalla de un campo de hora en un formulario de vista detallada:

![Campo de hora en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-time-pickup-closed.png "Campo de hora en un formulario de vista detallada")

Y aquí hay una captura de pantalla del selector de hora en estado abierto:

![Campo de hora en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-time-pickup-open.png "Campo de hora en un formulario de vista detallada")

Y así es como se ve el campo de hora en una vista de tabla:

![Campo de hora en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-time.png "Campo de hora en una vista de tabla")

Para crear un campo de hora, establezca el tipo de datos de su campo en `Time`. Si nombra un campo
`time`, se establecerá automáticamente en el tipo de datos `Time`.

Para establecer el formato de hora, puede hacerlo en **Configuración de localización** en las propiedades del proyecto.

## Carga de archivos

Este tipo de entrada permite a los usuarios cargar archivos. Aquí hay una captura de pantalla de un campo de carga de archivos en un formulario de vista detallada:

![Campo de carga de archivos en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-file-upload.png "Campo de carga de archivos en un formulario de vista detallada")

Y aquí hay una captura de pantalla de un campo de carga de archivos en una vista de tabla:

![Campo de carga de archivos en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-file.png "Campo de carga de archivos en una vista de tabla")

Para crear un campo de carga de archivos, establezca el tipo de datos de su campo en `Varchar` o `Char`. Luego, en la pestaña **Multimedia** de las propiedades del campo,
seleccione la opción **Carga de archivos**. Esto debería abrir el cuadro de diálogo **Opciones de carga de archivos** (puede abrirlo más tarde haciendo clic en el botón **Configurar** en la pestaña **Multimedia**).

Así es como se ve el cuadro de diálogo **Opciones de carga de archivos**:

![Cuadro de diálogo de opciones de carga de archivos](https://cdn.bigprof.com/images/file-upload-options-dialog.png "Cuadro de diálogo de opciones de carga de archivos")

En este cuadro de diálogo, puede especificar el tamaño máximo de archivo permitido para la carga, los tipos de archivo permitidos y otras opciones.

## Carga de imágenes

Este tipo de entrada permite a los usuarios cargar imágenes. Aquí hay una captura de pantalla de un campo de carga de imágenes en un formulario de vista detallada:

![Campo de carga de imágenes en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-image.png "Campo de carga de imágenes en un formulario de vista detallada")

Y aquí hay una captura de pantalla de un campo de carga de imágenes en una vista de tabla:

![Campo de carga de imágenes en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-image.png "Campo de carga de imágenes en una vista de tabla")

Para crear un campo de carga de imágenes, establezca el tipo de datos de su campo en `Varchar` o `Char`. Luego, en la pestaña **Multimedia** de las propiedades del campo,
seleccione la opción **Imagen**. Esto debería abrir el cuadro de diálogo **Opciones de imagen** (puede abrirlo más tarde haciendo clic en el botón **Configurar** en la pestaña **Multimedia**).

Así es como se ve el cuadro de diálogo **Opciones de imagen**:

![Cuadro de diálogo de opciones de imagen](https://cdn.bigprof.com/images/image-options-dialog.png "Cuadro de diálogo de opciones de imagen")

En este cuadro de diálogo, puede especificar el tamaño máximo de archivo permitido para la carga, las dimensiones de las miniaturas, el comportamiento del zoom y otras opciones.

Si nombra un campo `image`, `photo` o `picture`, se establecerá automáticamente como un campo de carga de imágenes.

## Mapa de Google

Este tipo de entrada muestra un mapa de Google en la vista detallada. El mapa es interactivo y permite a los usuarios acercar y alejar, así como moverse.
Aquí hay una captura de pantalla de un campo de mapa de Google en un formulario de vista detallada:

![Campo de mapa de Google en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-google-map-24.18.png "Campo de mapa de Google en un formulario de vista detallada")

En la vista de tabla, así como en la vista de impresión, el campo Mapa de Google muestra una imagen de mapa estática:

![Campo de mapa de Google en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-google-map.png "Campo de mapa de Google en una vista de tabla")

En AppGini, puede configurar el campo Mapa de Google para obtener la ubicación de una URL de Google Maps proporcionada por el usuario.

En AppGini 24.18 y versiones posteriores, también puede configurar el campo Mapa de Google para obtener la ubicación del dispositivo del usuario utilizando la API de geolocalización del navegador.
En este caso, el campo mostrará un mapa con un marcador en la ubicación actual del usuario:

![Campo de mapa de Google con la ubicación actual del usuario](https://cdn.bigprof.com/images/input-types-dv-google-map-with-user-location-24.18.png "Campo de mapa de Google con la ubicación actual del usuario")

Puede configurar la captura de la ubicación del usuario para que tenga lugar automáticamente cuando se crea y/o actualiza el registro, o manualmente cuando el usuario hace clic en un botón.

[Obtenga más información sobre la configuración de los campos de mapa de Google en su proyecto AppGini](../working-with-projects/media-tab.md#google-maps).

## Video de YouTube

Este tipo de entrada permite a los usuarios pegar una URL de video de YouTube para mostrar el video. Aquí hay una captura de pantalla de un campo de video de YouTube en un formulario de vista detallada:

![Campo de video de YouTube en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-youtube.png "Campo de video de YouTube en un formulario de vista detallada")

Y aquí hay una captura de pantalla de un campo de video de YouTube en una vista de tabla:

![Campo de video de YouTube en una vista de tabla](https://cdn.bigprof.com/images/input-types-tv-youtube.png "Campo de video de YouTube en una vista de tabla")

Para crear un campo de video de YouTube, establezca el tipo de datos de su campo en `Varchar` o `Char` con una longitud de al menos 200 caracteres. Luego, en la pestaña **Multimedia** de las propiedades del campo,
seleccione la opción **Video de YouTube**. Esto debería abrir el cuadro de diálogo **Opciones de video de YouTube** (puede abrirlo más tarde haciendo clic en el botón **Configurar** en la pestaña **Multimedia**).

Así es como se ve el cuadro de diálogo **Opciones de video de YouTube**:

![Cuadro de diálogo de opciones de video de YouTube](https://cdn.bigprof.com/images/youtube-video-options-dialog.png "Cuadro de diálogo de opciones de video de YouTube")

## Solo lectura

Esto no es exactamente un tipo de entrada, pero le permite mostrar un campo en modo de solo lectura.
Esto es útil cuando desea mostrar un campo que los usuarios no deben editar.

Para crear un campo de solo lectura, marque la opción **Solo lectura** en las propiedades del campo.

Aquí hay una captura de pantalla de un campo de solo lectura en un formulario de vista detallada:

![Campo de solo lectura en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-read-only.png "Campo de solo lectura en un formulario de vista detallada")

## Conclusión

AppGini admite una variedad de tipos de entrada para los campos de sus tablas. Esto le permite crear formularios ricos e interactivos que satisfacen muchos casos de uso diferentes.
Puede mezclar y combinar estos tipos de entrada para crear formularios que sean fáciles de usar y brinden una excelente experiencia de usuario.
