---
title: La pestaña Medios
linkTitle: La pestaña Medios
slug: help/working-with-projects/media-tab
description: Aprenda a configurar su campo para que se muestre como un enlace web, una imagen, un archivo, un mapa de Google o incluso un video de YouTube.
keywords: pestaña de medios, enlace, imagen, carga de archivos, mapa de google, video de youtube, geolocalización, clave api de google maps
---

# La pestaña Medios

Esta pestaña le permite configurar su campo para que se muestre como un enlace web, una imagen, un archivo, un mapa de Google o incluso un video de YouTube.

## Opción de enlace

Configure la forma en que se comporta su campo cuando se hace clic en él. Se puede configurar para abrir la vista detallada del registro actual, una URL, un enlace de correo electrónico o para que no se pueda hacer clic en absoluto.

![Opción de enlace](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/link_appgini.png)

Si configura el campo para que se muestre como un enlace web y el usuario hace clic en ese campo, el enlace se abre en una nueva ventana.

![Enlace como se muestra en la vista de tabla](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/link-browser.png)

## La opción Imagen

Esta opción le permite configurar el campo para que se muestre como una imagen. Puede permitir a los usuarios cargar imágenes jpg, jpeg, gif y png. También puede configurar el tamaño máximo de archivo permitido.

![Opción de imagen](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/image_appgini.png)

Puede elegir cómo mostrar la imagen. Se puede mostrar como una imagen en miniatura ampliable en la vista de tabla y en la vista detallada. También puede configurar el tamaño de la miniatura.

Este es un ejemplo de cómo se muestra la imagen en la vista detallada.

![Miniatura de imagen en la vista detallada](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/image_detail_view.png)

Y así es como se muestra la imagen en la vista de tabla.

![Miniatura de imagen en la vista de tabla](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/image_field_tv.png)

## La opción Carga de archivos

Esta opción permite al usuario cargar muchos tipos de archivos diferentes. Puede configurar el campo para que se muestre como el contenido del campo, un icono en el que se puede hacer clic o el contenido de otra página.

![Opción de carga de archivos](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/file_upload_appgini.png)

Así es como se muestra el campo de carga de archivos en la vista detallada.

![Campo de carga de archivos en la vista detallada](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/file_upload_dv.png)

Puede configurar el campo para que se muestre como el contenido del campo, un icono en el que se puede hacer clic o el contenido de otro campo.

![Campo de carga de archivos en la vista de tabla](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/file_upload_browser.png)

## Mapas de Google

Los campos de mapa de Google le permiten mostrar un mapa de Google en su aplicación.

![Campo de mapa de Google en un formulario de vista detallada](https://cdn.bigprof.com/images/input-types-dv-google-map-24.18.png "Campo de mapa de Google en un formulario de vista detallada")

Para crear un campo de mapa de Google, establezca el tipo de datos de su campo en `Varchar` o `Char` con una longitud de al menos 200 caracteres. Luego, en la pestaña **Medios** de las propiedades del campo, seleccione la opción **Mapa de Google**. Esto debería abrir el cuadro de diálogo **Opciones de mapa de Google** (puede abrirlo más tarde haciendo clic en el botón **Configurar** en la pestaña **Medios**).

![Cuadro de diálogo de opciones de mapa de Google](https://cdn.bigprof.com/images/google-map-dialog-24.18.png "Cuadro de diálogo de opciones de mapa de Google")

### Clave API de Google

Los campos de mapa de Google requieren una [clave API de Google](../configure-google-maps-api-key.md) para funcionar correctamente. Puede ingresar su clave API de Google en la página **Configuración de administrador** de su aplicación siguiendo los pasos a continuación:

1. Inicie sesión en su aplicación como superadministrador.
2. Vaya al **Área de administración** » menú **Utilidades** » **Configuración de administrador**.
3. En la pestaña **Aplicación**, ingrese su clave API de Google Maps en el campo **Clave API de Google**.

   ![Configuración de la clave API de Google Maps](https://cdn.bigprof.com/images/google-maps-api-key-setting-24.18.png "Configuración de la clave API de Google Maps")

Si, en lugar del mapa de Google, ve un mensaje de error como *`Google maps Platform rechazó su solicitud...`*, debe proporcionar una [clave API de Google Maps configurada correctamente](../configure-google-maps-api-key.md).

### Opciones de comportamiento y ubicación del mapa

Al configurar un campo para mostrar un mapa de Google, están disponibles las siguientes opciones para configurar el comportamiento y la ubicación del mapa:

#### 1. Mapa desde URL

Muestra un mapa utilizando una URL proporcionada por el usuario.

![Campo de mapa de Google en un formulario de vista detallada, basado en una URL proporcionada por el usuario](https://cdn.bigprof.com/images/input-types-dv-google-map-24.18.png "Campo de mapa de Google en un formulario de vista detallada, basado en una URL proporcionada por el usuario")

#### 2. Mapa con un marcador de la ubicación del usuario en el momento de guardar un nuevo registro

Fija automáticamente la ubicación del usuario cuando se guarda un nuevo registro.

![Campo de mapa de Google con la ubicación actual del usuario](https://cdn.bigprof.com/images/input-types-dv-google-map-with-user-location-24.18.png "Campo de mapa de Google con la ubicación actual del usuario")

#### 3. Mapa con un marcador de la ubicación del usuario en el momento de guardar un registro nuevo o existente

Igual que la opción anterior, pero también muestra la ubicación del usuario al guardar un registro existente.

#### 4. Mapa con un marcador de la ubicación del usuario solo si el usuario hace clic en *Capturar mi ubicación*

Muestra un marcador solo cuando el usuario elige capturar su ubicación manualmente.

![Campo de mapa de Google con la ubicación actual del usuario, capturada manualmente](https://cdn.bigprof.com/images/input-types-dv-google-map-with-user-location-manual-24.18.png "Campo de mapa de Google con la ubicación actual del usuario, capturada manualmente")

> Las opciones 2, 3 y 4 se introdujeron en AppGini 24.18. Requieren el consentimiento del usuario para acceder a su ubicación. Si el usuario niega el acceso, el mapa no mostrará su ubicación.

### Configuración de la vista del mapa

#### Vista de tabla (Miniatura)

En la vista de tabla, el campo del mapa se muestra como una imagen en miniatura (mapa estático). Para la [opción 1](#1-mapa-desde-url) anterior, el mapa en miniatura se genera a partir de la URL proporcionada por el usuario, sin un marcador. Para las [opciones 2 y 3](#2-mapa-con-un-marcador-de-la-ubicación-del-usuario-en-el-momento-de-guardar-un-nuevo-registro), el mapa en miniatura muestra la ubicación del usuario en el momento de guardar el registro, con un marcador. Y para la [opción 4](#4-mapa-con-un-marcador-de-la-ubicación-del-usuario-solo-si-el-usuario-hace-clic-en-capturar-mi-ubicación), el mapa en miniatura muestra la ubicación del usuario en el momento en que hace clic en el botón *Capturar mi ubicación*.

![Campo de mapa de Google en la vista de tabla, que muestra un mapa en miniatura](https://cdn.bigprof.com/images/input-types-tv-google-map-24.18.png "Campo de mapa de Google en la vista de tabla, que muestra un mapa en miniatura")

- **Ancho en píxeles**: Establezca el ancho del mapa en miniatura que se muestra en la vista de tabla. El valor predeterminado es `50` píxeles.
- **Alto en píxeles**: Establezca el alto del mapa en miniatura en la vista de tabla. El valor predeterminado es `50` píxeles.

#### Vista detallada (Mapa interactivo)

- **Ancho**: El ancho se establece automáticamente para el mapa interactivo en la vista detallada para que se ajuste al espacio disponible.
- **Alto en píxeles**: Establezca el alto del mapa interactivo que se muestra en la vista detallada del registro. El valor predeterminado es `360` píxeles.

### Forzar la captura de la ubicación del usuario

Si desea forzar la captura de la ubicación del usuario al guardar un registro nuevo o existente, establezca el campo Mapa de Google como **Obligatorio** en AppGini. Esto garantizará que se capture la ubicación del usuario antes de guardar el registro.
Si el usuario niega el acceso a su ubicación, se mostrará un mensaje de error y el registro no se guardará.

## Video de YouTube

Este campo acepta una URL de YouTube y la muestra como una película en la vista detallada.

![Opción de video de YouTube](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/youtube_field_appgini.png)

Puede configurar cómo mostrar el video de YouTube en la vista detallada y en la vista de tabla. Aquí hay un ejemplo de cómo se muestra el video de YouTube en la vista detallada.

![Video de YouTube en la vista detallada](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/youtube_field_dv.png)

Y así es como se muestra el video de YouTube en la vista de tabla.

![Video de YouTube en la vista de tabla](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/youtube_field_tv.png)
