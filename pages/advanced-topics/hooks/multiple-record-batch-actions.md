---
title: Agregar "acciones por lotes" personalizadas que se aplican a múltiples registros
linkTitle: Acciones por lotes
slug: help/advanced-topics/hooks/multiple-record-batch-actions
description: Aprenda cómo agregar acciones por lotes personalizadas a su aplicación generada por AppGini que se aplican a múltiples registros a la vez.
keywords: acciones por lotes, múltiples registros, vista de tabla, hooks, tablename_batch_actions, tablename-tv.js, imprimir etiquetas de correo, Northwind
---

# Agregar "acciones por lotes" personalizadas que se aplican a múltiples registros

Cuando selecciona uno o más registros en la vista de tabla, se muestra un botón "Más" encima de la tabla. Si hace clic en ese botón, se abre el menú de acciones por lotes. Este menú muestra algunas acciones que puede realizar en los registros que seleccionó; consulte la captura de pantalla a continuación. Las acciones que aparecen en el menú dependen de los permisos que tenga.

![Menú de acciones por lotes](https://cdn.bigprof.com/appgini-desktop/wp-content/uploads/select-multiple-records-show-batch-actions.png)

Por ejemplo, si es un administrador, puede cambiar el propietario de los registros. Si tiene permisos de eliminación y ha habilitado la eliminación masiva en AppGini, puede eliminar los registros.

## Agregar acciones por lotes personalizadas

> **¡CONSEJO!**
>
> ¿No tiene el tiempo o los conocimientos de programación para escribir sus propias acciones por lotes? ¡Ahora tenemos un complemento para eso! Consulte nuestro [complemento de Actualización masiva](/appgini/applications/mass-update-plugin). Este complemento le permite agregar tantas acciones por lotes como desee en muy poco tiempo, sin escribir una sola línea de código.

Puede definir sus propias acciones por lotes dentro del cuerpo de la función `tablename_batch_actions()` en el archivo `hooks/tablename.php` generado. En esta función, solo define el nombre de la acción por lotes. Puede agregar los detalles y la funcionalidad de la acción por lotes en otro lugar al que llegaremos en un momento. El hook `tablename_batch_actions()` funciona devolviendo una matriz de acciones. Su aplicación AppGini recibe esta matriz y muestra las acciones en el menú "Más".

Cuando un usuario elige una acción del menú "Más", su aplicación AppGini llama a la función javascript vinculada a esa acción. El nombre de esta función javascript es parte de los datos en la matriz que mencionamos anteriormente (la matriz devuelta por el hook `tablename_batch_actions`).

Debe definir la función javascript en el archivo `tablename-tv.js` dentro de la carpeta `hooks`. Esta función podría hacer cualquier cosa que desee aplicar a los registros seleccionados. Podría abrir una nueva página, realizar una solicitud ajax o cualquier otra acción que desee realizar. No hay una implementación específica que deba seguir aquí. Discutiremos una acción de ejemplo con todos estos detalles a continuación para que pueda usarla como guía.

Este diagrama explica cómo funciona todo esto.

![Diagrama de acciones por lotes](https://cdn.bigprof.com/appgini-desktop/wp-content/uploads/appgini-record-action-hook.png)

Entonces, aquí está la secuencia de eventos:

1. El usuario abre la vista de tabla de una tabla en su aplicación AppGini.
2. La aplicación llama a la función hook `tablename_batch_actions()`. Aquí es donde define las acciones adicionales que los usuarios pueden elegir.
3. Esta función devuelve una matriz que describe una o más acciones y el nombre de la función javascript a la que llamar si el usuario selecciona una acción. La aplicación agrega esas acciones al menú "Más".
4. Si el usuario selecciona uno o más registros, abre el menú "Más" y elige una de las acciones que definió في el hook `tablename_batch_actions()`, la aplicación pasa los ID de los registros seleccionados a la función javascript que asoció con esa acción.

## Ejemplo: Agregar una acción por lotes para imprimir etiquetas de correo para los registros seleccionados

Volviendo al ejemplo de la tabla de clientes:

![Tabla de clientes](https://cdn.bigprof.com/appgini-desktop/wp-content/uploads/select-multiple-records-show-batch-actions.png)

Digamos que desea agregar una acción por lotes para imprimir etiquetas de correo para los clientes seleccionados. Así es como puede hacerlo: el primer paso es agregar la acción al hook `customers_batch_actions()`. Para hacerlo, abriremos el archivo `hooks/customers.php`, deberíamos encontrar nuestra función hook:

```php
function customers_batch_actions(&$args){
 
    return array();
}
```

La función anterior está vacía (la llamamos función esqueleto). Necesitamos agregarle nuestra acción. Entonces, modifiquémosla para que diga:

```php
function customers_batch_actions(&$args){
 
    return [
        [
            'title' => 'Imprimir etiquetas de correo',
            'function' => 'print_mail_labels',
            'icon' => 'th-list'
        ]
    ];
}
```

El código anterior le dice a nuestra aplicación que muestre una acción adicional en el menú "Más" con la etiqueta "Imprimir etiquetas de correo". Si un usuario elige esa acción, la aplicación pasará los ID (valores de clave principal) de los registros seleccionados a una función javascript llamada `print_mail_labels()`. Aún no hemos escrito esta función. Lo haremos en un momento. Pero antes de hacerlo, echemos un vistazo al menú "Más" después de agregar el código anterior.

![Menú Más con la acción de imprimir etiquetas de correo](https://cdn.bigprof.com/appgini-desktop/wp-content/uploads/new-batch-action-defined.png)

Hemos especificado un nombre de icono en el código anterior. Por lo tanto, el icono aparece a la izquierda de la nueva acción. Para obtener una lista completa de los nombres de iconos admitidos, consulte la [lista de Glyphicons de Bootstrap](https://getbootstrap.com/components/#glyphicons). Todos los iconos allí tienen un nombre como "glyphicon-xyz"... simplemente use la parte xyz en nuestro código de hook para especificar un icono.

> **¡CONSEJO!**
>
> Para mostrar la acción por lotes solo a los usuarios de un grupo específico, puede agregar una verificación condicional en la función hook. Por ejemplo, para mostrar la acción solo a los usuarios del grupo 'Admins', puede agregar el siguiente código:
> ```php
> $memberInfo = getMemberInfo();
> // si el usuario actual no es un administrador, devuelve una matriz vacía
> if($memberInfo['group'] != 'Admins') return [];
>
> return [ ... ]; // su matriz de acciones por lotes aquí
> ```

El siguiente paso es definir la función javascript `print_mail_labels()`. Esta es la función a la que nuestra aplicación llamaría si el usuario hace clic en el elemento "Imprimir etiquetas de correo" en el menú. Deberíamos escribir esta función en el archivo `customers-tv.js` en la carpeta `hooks`... Si no encuentra ese archivo en la carpeta, simplemente créelo allí... el formato es `tablename-tv.js` (donde `tablename` es el nombre de la tabla en cuestión). Si el archivo existe en la carpeta `hooks`, se carga en la vista de tabla. Por lo tanto, cualquier código javascript que coloque allí se ejecutará en la vista de tabla de la tabla en cuestión.

Escribamos nuestro código en el archivo `customers-tv.js` de la siguiente manera:

```javascript
function print_mail_labels(table_name, ids) {
    alert("ID seleccionados de " + table_name + ": " + ids);
}
```

Esto es lo que sucede cuando elegimos la acción "Imprimir etiquetas de correo" después de agregar el código anterior:

![Alerta que muestra los ID seleccionados](https://cdn.bigprof.com/appgini-desktop/wp-content/uploads/testing-new-batch-action-javascript-function-parameters.png)

El código anterior simplemente muestra los parámetros pasados a la función `print_mail_labels()`. Cuando escriba la función javascript, debe escribirla para que reciba dos parámetros. El primero es una cadena que contiene el nombre de la tabla (esto es útil si tiene una función para manejar múltiples tablas), y el segundo es una matriz de ID de registros seleccionados (valores de clave principal de los registros seleccionados).

Cambiemos el código javascript para hacer algo más útil. Pasaremos los ID seleccionados a un script PHP para mostrar las etiquetas de correo de esos registros. Así que reescribamos la función `print_mail_labels()` de la siguiente manera.

```javascript
function print_mail_labels(table_name, ids) {
    /*
      abriremos la página de etiquetas de correo en una nueva ventana
      esa página es un script PHP del lado del servidor llamado mail-labels.php
      pero primero, preparemos los parámetros para enviar a ese script
    */
    var url = 'mail-labels.php?table=' + table_name;
    for(var i = 0; i < ids.length; i++){
        url = url + '&'
            + encodeURI('ids[]') + '='
            + encodeURIComponent(ids[i]);
    }
     
    window.open(url);
}
```

Finalmente, escribamos el script `mail-labels.php` del lado del servidor. Según el código anterior, asumimos que la ubicación de este script es la carpeta principal de nuestra aplicación AppGini. Así es como podría verse este script:

```php
<?php
    /*
      Incluir los siguientes archivos nos permite usar muchos accesos directos
      funciones proporcionadas por AppGini. Aquí, usaremos las
      siguientes funciones:
        makeSafe()
            proteger contra ataques maliciosos de inyección SQL
        sql()
            conectarse a la base de datos y ejecutar una consulta SQL
        db_fetch_assoc()
            igual que la función mysqli_fetch_assoc() integrada de PHP
    */
    include(__DIR__ . "/lib.php");
     
    /* recibir parámetros de llamada */
    $table = $_REQUEST['table'];
    $ids = $_REQUEST['ids']; /* esto es una matriz de ID */
     
    /* una lista de ID separada por comas para usar en la consulta */
    $cs_ids = '';
    foreach($ids as $id){
        $cs_ids .= "'" . makeSafe($id) . "',";
    }
    $cs_ids = substr($cs_ids, 0, -1); /* eliminar la última coma */
     
    /* recuperar los registros y mostrar las etiquetas de correo */
    $eo = ['silentErrors' => true];
    $res = sql("select * from customers " .
               "where CustomerID in ({$cs_ids})", $eo);
    while($row = db_fetch_assoc($res)){
        ?>
        <b><?php echo $row['CompanyName']; ?></b><br>
        <i>C/O <?php echo $row['ContactName']; ?></i><br>
        <?php echo $row['Address']; ?><br>
        <?php echo $row['City']; ?><br>
        <?php echo $row['Region']; ?>
        <?php echo $row['PostalCode']; ?><br>
        <?php echo $row['Country']; ?><br>
        <br>
        <br>
        <hr>
        <?php
    }
```

Aquí hay una muestra de la salida del script anterior.

![Muestra de etiquetas de correo](https://cdn.bigprof.com/appgini-desktop/wp-content/uploads/sample-output-from-mail-labels.png)

Elegimos implementar el manejo de acciones usando una función javascript para permitir mucha flexibilidad para las personalizaciones. En el ejemplo anterior, preparamos algunos parámetros y abrimos una nueva página. En su lugar, es posible que desee hacer algo en segundo plano utilizando una solicitud Ajax sin abrir una nueva página. Todo depende de usted.

Nota: El ejemplo anterior utilizó el proyecto Northwind, que es el mismo que se utilizó para nuestra [demostración en línea](https://northwind.demos.appgini.com/). Puede [descargar el archivo del proyecto Northwind, los archivos de la aplicación y los datos de muestra](https://github.com/bigprof-software/northwind-demo/releases/latest) para experimentar por su cuenta.

> **¡CONSEJO!**
>
> ¿No tiene el tiempo o los conocimientos de programación para escribir sus propias acciones por lotes? ¡Ahora tenemos un complemento para eso! Consulte nuestro [complemento de Actualización masiva](/appgini/applications/mass-update-plugin). Este complemento le permite agregar tantas acciones por lotes como desee en muy poco tiempo, sin escribir una sola línea de código.
