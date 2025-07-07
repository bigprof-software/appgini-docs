---
title: Internacionalización (i18n) y localización de su aplicación AppGini
linkTitle: Internacionalización (i18n)
slug: help/application-features/i18n-internationalization
description: Aprenda cómo localizar su aplicación AppGini a cualquier idioma que desee, incluida la traducción de la interfaz de la aplicación, los nombres de tablas y campos, y más.
keywords: internacionalización, i18n, localización, idioma, traducir, traducción, localizar, appgini, app, aplicación, tabla, campo, nombre, título, interfaz, vista detallada, página de inicio, grupo, título, título de la aplicación, tabla secundaria, pestaña, columna, programáticamente, acceso, cadenas localizadas
---

# Internacionalización (i18n) y localización de su aplicación AppGini

Las aplicaciones AppGini están preparadas para la internacionalización, lo que significa que puede localizar fácilmente su aplicación a cualquier idioma que desee.
Esto se hace traduciendo el archivo `language.php` generado, que contiene todas las cadenas utilizadas en la interfaz de su aplicación.

> AppGini proporciona una herramienta de traducción integrada para ayudarlo con esta tarea, como veremos a continuación.
> Por lo tanto, no debe editar manualmente el archivo `language.php`.

En esta página, analizaremos cómo localizar su aplicación AppGini a un nuevo idioma. También analizaremos cómo
localizar nombres de tablas y campos, que no están incluidos en el archivo `language.php`.

## Localización de la interfaz de su aplicación (`language.php`)

### Descarga de un archivo de idioma pretraducido

Los usuarios de AppGini han contribuido con traducciones a muchos idiomas.
Están disponibles para descargar desde la [página de archivos de idioma](https://bigprof.com/appgini/download-language-files).
Consulte esa página para ver si ya hay disponible una traducción para el idioma deseado. Si es así, puede descargarla
en el directorio principal de su aplicación, reemplazando el archivo `language.php` existente.

A medida que introducimos nuevas funciones y cadenas en AppGini, el archivo de idioma puede quedar incompleto,
por lo que es posible que deba actualizarlo de vez en cuando.

En caso de que necesite traducir su aplicación a un idioma que no está disponible en la página de archivos de idioma,
o si necesita actualizar una traducción existente, puede utilizar la herramienta de traducción integrada en AppGini.

### Uso de la herramienta de traducción integrada

A partir de AppGini 22.11, hemos agregado una herramienta de traducción integrada para ayudarlo a traducir su aplicación a cualquier idioma que desee.
Para utilizar esta herramienta, siga estos pasos:

1. Inicie sesión en su aplicación como administrador.
2. Haga clic en el enlace 'Área de administración' en la parte superior de la página.
3. Abra el menú 'Utilidades' y haga clic en 'Herramienta de traducción'.

Aquí hay un video que muestra cómo usar la herramienta de traducción:

<video style="width: 100%; height: auto;" controls>
  <source src="https://cdn.bigprof.com/screencasts/appgini-22.11-translation-tool.mp4" type="video/mp4">
  Su navegador no es compatible con la etiqueta de video.
</video>

En el video anterior, estamos traduciendo las palabras 'Admin area' a las palabras árabes 'منطقة الإدارة'.

### Reserva de idioma

Si no se encuentra una cadena en el archivo `language.php`, AppGini recurrirá a la cadena en inglés,
que se incluye en el archivo `defaultLang.php` generado.

## Idiomas de derecha a izquierda (RTL)

AppGini admite idiomas de derecha a izquierda (RTL), como el árabe y el hebreo.
Para habilitar la compatibilidad con RTL en su aplicación, abra el archivo de proyecto de su aplicación en AppGini,
haga clic en el icono 'Tema de la aplicación' en la barra de herramientas y marque la casilla de verificación 'RTL'.

![Habilitar compatibilidad con RTL en su aplicación](https://cdn.bigprof.com/images/enable-rtl-layout.png "Habilitar compatibilidad con RTL en su aplicación")

## Localización de nombres de tablas y campos

El archivo `language.php` contiene cadenas utilizadas en la interfaz de la aplicación, como botones, etiquetas y mensajes.
Sin embargo, no contiene nombres de tablas y campos. Para localizarlos, puede abrir el archivo de proyecto AXP en AppGini,
hacer clic en la tabla o campo que desea localizar e ingresar el nombre localizado en el cuadro 'Título'.

![Localización de nombres de tablas y campos](https://cdn.bigprof.com/images/localize-table-field-names.png "Localización de nombres de tablas y campos")

## Localización del título de la vista detallada (formulario de edición de registros)

De forma predeterminada, el título de la vista detallada (formulario de edición de registros) es 'Vista detallada'. Puede localizar este título
abriendo el archivo de proyecto AXP en AppGini, haciendo clic en la tabla que desea localizar e ingresando el título localizado
en el cuadro 'Título de la vista detallada'. Vea la captura de pantalla a continuación:

![Cómo cambiar el título de la vista detallada](https://cdn.bigprof.com/images/detail-view-title.png "Cómo cambiar el título de la vista detallada")

Y aquí está la vista detallada de la tabla de pedidos con el título localizado en alemán 'Bestelldetails':

![Vista detallada con título localizado](https://cdn.bigprof.com/images/detail-view-localized-title.png "Vista detallada con título localizado")

## Localización de los títulos de los grupos de tablas de la página de inicio

AppGini le permite agrupar tablas similares bajo un título común en la página de inicio.
Esto facilita a los usuarios la navegación por su aplicación. Puede utilizar títulos localizados para estos grupos.
Para establecer el título del grupo de tablas:

1. Abra el archivo de proyecto AXP en AppGini.
2. Haga clic en la tabla que desea localizar.
3. Haga clic en el botón titulado 'Grupo de tablas' para abrir el cuadro de diálogo 'Grupos de tablas'.
4. Haga clic en el grupo de tablas que desea localizar.
5. Presione **`F2`** o el botón 'Renombrar' para renombrar el grupo.

![Localización de títulos de grupos de tablas](https://cdn.bigprof.com/images/localize-table-group-titles.png "Localización de títulos de grupos de tablas")

Aquí está la página de inicio de la aplicación con el título del grupo de tablas localizado al griego:

![Página de inicio con título de grupo de tablas localizado](https://cdn.bigprof.com/images/home-page-localized-table-group-title.png "Página de inicio con título de grupo de tablas localizado")

> **Nota**: Después de cambiar el nombre del grupo de tablas a algunos caracteres no latinos, es posible que vea signos de interrogación u otros caracteres inesperados en el título del grupo
> en AppGini. Este es un problema conocido en AppGini y no afecta la visualización real del título del grupo en la aplicación.

## Localización del título de la aplicación

El título de la aplicación se muestra en la barra de título del navegador y en la esquina superior izquierda de la aplicación.
Puede establecerlo en un título localizado abriendo el archivo de proyecto AXP en AppGini, haciendo clic en el nodo superior
en el árbol del explorador de proyectos a la izquierda, luego presionando **`F2`** para cambiar el nombre de la aplicación. Los guiones bajos en el nombre de la aplicación
se reemplazarán con espacios en el título mostrado.

Los caracteres no latinos en el título de la aplicación provocarán un mensaje de error y AppGini no los aceptará.
Como solución alternativa, puede establecer el título de la aplicación en un nombre latino, luego, después de generar la aplicación, puede
editar el archivo `hooks/header-extras.php` o `hooks/footer-extras.php` generado y agregar el siguiente código:

```html
<script>
  const appTitle = 'Διαχειριστής Συντήρησης Ενοικιαζόμενης Περιουσίας';
  document.querySelector('a.navbar-brand').innerHTML = `<i class="glyphicon glyphicon-home"></i> ${appTitle}`;
  document.title = appTitle;
</script>
```

Reemplace el texto griego en la variable `appTitle` con el título de su aplicación localizado. Aquí está el resultado del código anterior:

![Página de inicio con título de grupo de tablas localizado](https://cdn.bigprof.com/images/home-page-localized-table-group-title.png "Página de inicio con título de grupo de tablas localizado")

## Localización de los títulos de las tablas secundarias

Cuando tiene una tabla principal con tablas secundarias, por ejemplo, una tabla principal `transportistas` con una tabla secundaria `pedidos`,
puede configurar la tabla `transportistas` para mostrar los pedidos secundarios como una pestaña en la vista detallada como se muestra a continuación:

![Tabla secundaria como pestaña en la vista detallada](https://cdn.bigprof.com/images/child-table-as-tab.png "Tabla secundaria como pestaña en la vista detallada")

También puede mostrar el recuento de pedidos secundarios como una columna en la tabla principal de transportistas como se muestra a continuación:

![Recuento de tablas secundarias como columna en la tabla principal](https://cdn.bigprof.com/images/child-table-count-as-column.png "Recuento de tablas secundarias como columna en la tabla principal")

Para ambas capturas de pantalla anteriores, el título de la tabla de pedidos secundarios se establece como 'Pedidos a través del transportista'. Podemos localizar este título
abriendo el archivo de proyecto AXP en AppGini, haciendo clic en la tabla principal (en este caso, `transportistas`), luego haciendo clic en el botón **Configuración de padre/hijo**
para abrir el cuadro de diálogo **Configuración de padre/hijo**.

![Apertura del cuadro de diálogo de configuración de padre/hijo](https://cdn.bigprof.com/images/parent-children-settings.png "Apertura del cuadro de diálogo de configuración de padre/hijo")

Haga clic en la tabla secundaria deseada de la cuadrícula de la izquierda si aún no está seleccionada, luego ingrese el título localizado en el cuadro **Título de pestaña/columna**.

> **Nota**: Si el título contiene caracteres no latinos, es posible que vea signos de interrogación u otros caracteres inesperados en el título en la cuadrícula.
> Este es un problema conocido en AppGini y no afecta la visualización real del título en la aplicación.

## Acceso programático a cadenas localizadas

Puede acceder a cadenas localizadas en sus hooks utilizando la variable PHP `$Translation`. Esta es una matriz asociativa
donde las claves son cadenas/códigos cortos en inglés y los valores son las cadenas localizadas. Esta variable está definida
en `language.php` y puede estar disponible dentro de cualquier función hook de PHP incluyendo la siguiente línea en la parte superior de la función:

```php
global $Translation;
```

Luego puede acceder a cualquier cadena localizada por su cadena/código corto en inglés de la siguiente manera:

```php
echo $Translation['last modified']; // --> 'zuletzt geändert' en alemán
```

También puede acceder a cadenas localizadas utilizando el objeto JavaScript `AppGini.Translate._map`. Por ejemplo:

```javascript
console.log(AppGini.Translate._map['last modified']); // --> 'zuletzt geändert' en alemán
```
