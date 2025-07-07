---
title: Archivos mágicos en la carpeta hooks
linkTitle: Archivos mágicos
slug: help/advanced-topics/hooks/magic-files
description: Aprenda sobre los archivos mágicos en la carpeta hooks que puede crear para alterar el comportamiento de su aplicación generada por AppGini.
keywords: hooks, eventos, personalización, avanzado, código, generado, aplicación, persistente, código personalizado, generación de código, insertar, eliminar, editar, seleccionar, registros, acciones, comportamiento, apariencia, objeto DataList, tablename_init, función hook, tabla, propiedades DataList, hooks globales, hooks específicos de tabla, links-home, links-navmenu, footer-extras, header-extras, tablename-dv.js, tablename-tv.js, tablename.fieldname.csv
---

# Archivos mágicos en la carpeta `hooks`

Puede crear algunos archivos con nombres específicos dentro de la carpeta `hooks` que su aplicación generada por AppGini usaría para realizar una tarea específica. Estos archivos son opcionales, lo que significa que si existen, su aplicación los usará automáticamente para alterar un comportamiento predeterminado. Pero si no existen, se aplicará el comportamiento predeterminado.

## `tablename-dv.js`: modificar el comportamiento de la vista detallada a través de JavaScript

Si crea un archivo en la carpeta `hooks` y lo nombra `tablename-dv.js` (donde *`tablename`* es el nombre de una tabla en su aplicación), AppGini cargará automáticamente ese archivo y lo ejecutará como un archivo JavaScript en el navegador cada vez que se muestre la vista detallada de la tabla especificada. Esto es muy útil para ejecutar código JavaScript en la vista detallada.

Por ejemplo, supongamos que tenemos una tabla *exams* y un campo de puntuación en esa tabla. Queremos limitar el contenido de ese campo a un cierto rango de números y advertir al usuario si ingresa un número fuera de ese rango. Para hacerlo, podríamos agregar un código JavaScript como el siguiente en el archivo mágico `hooks/exams-dv.js`.

```javascript
$j(function() { 
    $j('#score').on('change', function() {
        var score = parseInt($j('score').val());
        if(isNaN(score) || score > 100 || score < 0){
            alert('¡La puntuación debe estar entre 0 y 100!');
            $j('#score').focus();
        }
    });
});
```

La línea 1 en el código anterior se asegura de que este código no se ejecute hasta que el contenido de la página y jQuery se carguen para evitar activar un error.

## `tablename-tv.js`: modificar el comportamiento de una tabla específica a través de JavaScript

Si crea un archivo en la carpeta `hooks` y lo nombra `tablename-tv.js` (donde *`tablename`* es el nombre de una tabla en su aplicación), AppGini cargará automáticamente ese archivo y lo ejecutará como un archivo JavaScript en el navegador cada vez que se muestre la tabla especificada. Esto es muy útil para modificar el contenido/diseño de la página o agregar un comportamiento personalizado.

Para ver un ejemplo de cómo se puede usar esto para agregar nuevas acciones por lotes, consulte la [documentación del hook `batch_actions()`](/appgini/help/advanced-topics/hooks/multiple-record-batch-actions/).

Tenga en cuenta que, a pesar del sufijo `-tv`, este archivo siempre se carga cuando se visualiza la tabla específica, ya sea que se muestre la vista de tabla o no. Si desea ejecutar código *solo si* la vista de tabla está visible, puede realizar esta verificación en el archivo `tablename-tv.js`:

```javascript
$j(() => {
  if(!$j('.table_view').length) return;
      
  // cualquier código agregado a continuación se ejecutará solo en la vista de tabla
});
```

## `tablename.fieldname.csv`: cambiar el contenido de las listas de opciones

![Ejemplo de lista de opciones en una aplicación generada por AppGini](https://cdn.bigprof.com/appgini-desktop/help/options-list-in-detail-view.png)

En AppGini, puede definir un campo como una lista de opciones para que los usuarios de su aplicación puedan seleccionar el valor del campo de un conjunto de opciones. Por ejemplo, el campo País en la captura de pantalla de la izquierda es una lista de opciones.

Ahora, ¿qué sucede si desea modificar el contenido de esa lista de opciones, por ejemplo, para limitar la lista a algunos países y eliminar los demás? Normalmente, tendría que abrir su proyecto en AppGini, ir al campo País, modificar el contenido de la lista, regenerar su aplicación y cargarla. Es un camino largo.

Por lo tanto, proporcionamos un método más fácil que no implica regenerar la aplicación. Simplemente, cree un archivo de texto en la carpeta `hooks` generada y nómbrelo con este patrón: `tablename.fieldname.csv`. Por ejemplo, para la lista de Países en la captura de pantalla, el archivo debe llamarse `customers.Country.csv`. A continuación, complete este archivo con todas las opciones que desea que el usuario pueda elegir, separadas por dos puntos y coma. Aquí están los contenidos del archivo para una selección de solo 3 países como ejemplo:

```
Estados Unidos;;Reino Unido;;Francia
```

Ahora es muy fácil editar este archivo usando cualquier editor de texto para agregar/eliminar/modificar opciones, sin tener que regenerar su aplicación. Sin embargo, tenga en cuenta que este archivo tiene prioridad sobre las opciones proporcionadas en su proyecto AppGini. Por lo tanto, si decide más tarde modificar las opciones en su archivo de proyecto y regenerar su aplicación, debe eliminar el archivo hook `tablename.fieldname.csv` o actualizarlo con las nuevas opciones.
