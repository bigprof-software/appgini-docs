---
title: Libro de recetas de personalización
linkTitle: Libro de recetas de personalización
slug: help/advanced-topics/customization-cookbook
keywords: personalización, libro de recetas, recetas, hooks, footer-extras.php, tablename-dv.js
description: Recetas rápidas para personalizaciones comunes.
---

# Libro de recetas de personalización

Esta página contiene recetas rápidas para personalizaciones comunes que puede aplicar a sus aplicaciones AppGini. Esta es una página dinámica que se actualizará con nuevas recetas con el tiempo.
¡Así que marque esta página como favorita y vuelva a consultarla a menudo!

## Desactivar los botones de diseño de la vista detallada

Añada el siguiente código a `hooks/footer-extras.php` para desactivar los botones de diseño de la vista detallada (los botones que permiten a los usuarios cambiar los diseños de una, dos y tres columnas en la vista detallada) en todas las tablas:

```html
<script>AppGini.renderDVLayoutToolbar = () => {};</script>
```

Si desea desactivar los botones de diseño solo en ciertas tablas, puede crear el archivo `hooks/tablename-dv.js` si aún no existe (reemplace `tablename` con el nombre real de la tabla) y añadirle el siguiente código:

```js
AppGini.renderDVLayoutToolbar = () => {};
```


## Cambiar el icono en el que se puede hacer clic para los enlaces de una tabla

Si desea cambiar el icono en el que se puede hacer clic para los enlaces de una tabla específica y evitar tener que actualizar manualmente el icono después de cada compilación del proyecto, puede utilizar la siguiente solución. Cree un archivo llamado `tablename-tv.js` en la carpeta `hooks` (reemplace `tablename` con el nombre real de la tabla que contiene el campo de enlace) y añádale el siguiente código JavaScript:

```js
$j(() => {
   $j('.tablename-fieldname .glyphicon').removeClass('glyphicon-globe').addClass('glyphicon-shopping-cart');
});
```

Reemplace `tablename` por el nombre de su tabla y `fieldname` por el nombre de su campo de enlace. Este código cambia el icono de globo terráqueo predeterminado (`glyphicon-globe`) por un icono de carrito de la compra (`glyphicon-shopping-cart`).

Al colocar este código en la carpeta `hooks`, sus cambios persistirán incluso si regenera la aplicación más tarde.


## Anteponer un símbolo de moneda a los campos de importe en la vista de tabla

Si desea anteponer un símbolo de moneda (por ejemplo, ₹ para la rupia india) a los campos de importe en la vista de tabla de su aplicación AppGini, puede utilizar CSS para una solución sencilla. Este método es más fácil de usar que utilizar la pestaña **Formato de datos** en AppGini y editar el archivo `dataFormats.cfg` y le permite personalizar la visualización sin afectar a sus consultas de base de datos.

Abra el archivo generado `hooks/footer-extras.php` en su proyecto y añada el siguiente código al final del archivo:

```php
<?php if(Request::val('Print_x')) : ?>
  <style>
    /* el formato es: td.{tablename}-{fieldname} */
    td.orders-Total::before,
    td.order_details-UnitPrice::before,
    td.order_details-SubTotal::before  /* Atención: ¡sin coma (,) después del último campo! */
      { content: '₹'; }
  </style>
<?php else : ?>
  <style>
    td.orders-Total > a::before,
    td.order_details-UnitPrice > a::before,
    td.order_details-SubTotal > a::before  /* Atención: ¡sin coma (,) después del último campo! */
      { content: '₹'; }
  </style>
<?php endif; ?>
```

**Explicación del código**

- El **primer bloque** (líneas 2-8) especifica el símbolo de moneda (`₹`) para los campos de importe en la **vista de impresión**.
- El **segundo bloque** (líneas 10-15) especifica el símbolo de moneda (`₹`) para los campos de importe en la **vista de tabla**.

Puede reemplazar `₹` por cualquier símbolo de moneda de su elección. Por ejemplo, `$` para USD o `€` para EUR.

Para especificar un símbolo de moneda para un campo en particular, utilice el formato `td.{tablename}-{fieldname}`. Por ejemplo:

- Para una tabla llamada `invoices` con un campo de importe llamado `total`, utilice el selector `td.invoices-total`.

A continuación, se muestra un ejemplo de cómo se verá la vista de tabla después de aplicar el código anterior:

![Ejemplo de símbolo de moneda](https://cdn.bigprof.com/images/currency-symbol-in-table-view.png)


## Dividir las búsquedas de botones de opción en dos columnas

Los [campos de búsqueda](../working-with-projects/understanding-lookup-fields.md) en AppGini se pueden mostrar como una lista desplegable o como botones de opción. Si tiene un campo de búsqueda con muchas opciones, mostrarlas como botones de opción puede hacer que el formulario sea demasiado largo y difícil de navegar.

![Un campo de búsqueda de botones de opción](https://cdn.bigprof.com/images/radio-button-lookup-field.png)

Para mejorar la experiencia del usuario, puede dividir las opciones de los botones de opción en dos columnas. Esto se puede hacer añadiendo una regla CSS sencilla a su archivo `hooks/footer-extras.php`. Primero, debemos identificar el nombre exacto del campo o campos de búsqueda que queremos modificar, lo cual podemos encontrar en el proyecto AppGini.

En la captura de pantalla anterior, por ejemplo, el campo de búsqueda se llama `ReportsTo`. Para dividir los botones de opción en dos columnas, podemos añadir la siguiente regla CSS al archivo `hooks/footer-extras.php`:

```html
<style>
/* Regla CSS para dividir el campo de búsqueda de botones de opción en dos columnas */
/* Reemplace 'ReportsTo' por el nombre real de su campo de búsqueda */
#ReportsTo-combo-list {
  br:nth-of-type(2n+1) { display: none; }
  label { width: 200px; } /* Ajuste el ancho según sea necesario */
}
</style>
```

Este es el mismo campo después de aplicar la regla CSS anterior:

![Campo de búsqueda de botones de opción dividido en dos columnas](https://cdn.bigprof.com/images/radio-button-lookup-field-split.png)

Si tiene varios campos de búsqueda que desea modificar, puede combinarlos en una sola regla CSS. Por ejemplo, si tiene dos campos de búsqueda llamados `ReportsTo` y `Status`, puede utilizar la siguiente regla CSS:

```html
<style>
/* Regla CSS para dividir varios campos de búsqueda de botones de opción en dos columnas */
/* Reemplace 'ReportsTo' y 'Status' por los nombres reales de sus campos de búsqueda */
#ReportsTo-combo-list,
#Status-combo-list {
  br:nth-of-type(2n+1) { display: none; }
  label { width: 200px; } /* Ajuste el ancho según sea necesario */
}
</style>
```

Esto aplicará el mismo diseño de dos columnas a ambos campos de búsqueda. Puede ajustar el ancho de las etiquetas según sea necesario para que se ajusten a su diseño.
