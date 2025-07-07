---
title: Hooks específicos de tabla
linkTitle: Hooks específicos de tabla
slug: help/advanced-topics/hooks/table-specific-hooks
description: Los hooks específicos de tabla son funciones que se llaman cuando se agrega un nuevo registro, cuando se edita un registro, cuando se elimina un registro, etc. Estos hooks son específicos de tabla. Es por eso que cada tabla en su proyecto tiene su propio archivo hook.
keywords: hooks específicos de tabla, hooks, tabla, insertar, actualizar, eliminar, registro, editar, agregar, nuevo, datos, memberInfo, args, options, header, footer, init, before_insert, after_insert, before_update, after_update, before_delete, after_delete, dv, csv, batch_actions, acciones por lotes de múltiples registros
---

# Hooks específicos de tabla

Para cada tabla de su proyecto, AppGini genera un archivo hook con el mismo nombre que el nombre de la tabla
dentro de la carpeta `hooks`. Este archivo contiene funciones hook que se llaman cuando
se agrega un nuevo registro, cuando se edita un registro, cuando se elimina un registro
, etc. Estos hooks son específicos de tabla. Es por eso que cada
tabla en su proyecto tiene su propio archivo hook.

*Las siguientes funciones de hook se definen en este archivo:*

- [`tablename_before_insert()`](#tablename_before_insert)
- [`tablename_after_insert()`](#tablename_after_insert)
- [`tablename_before_update()`](#tablename_before_update)
- [`tablename_after_update()`](#tablename_after_update)
- [`tablename_before_delete()`](#tablename_before_delete)
- [`tablename_after_delete()`](#tablename_after_delete)
- [`tablename_dv()`](#tablename_dv)
- [`tablename_csv()`](#tablename_csv)
- [`tablename_init()`](#tablename_init)
- [`tablename_header()`](#tablename_header)
- [`tablename_footer()`](#tablename_footer)
- [`tablename_batch_actions()`](/appgini/help/advanced-topics/hooks/multiple-record-batch-actions/)




## `tablename_init()`


Llamado antes de representar la página. Este es un hook muy poderoso que
le permite controlar todos los aspectos de cómo se representa la página. Si
abre el archivo `hooks/tablename.php` generado en un editor de texto (donde
tablename es el nombre de la tabla en cuestión), puede ver esta función
definida de la siguiente manera:

```php
function tablename_init(&$options, $memberInfo, &$args) {

    return true;
}
```


### Parámetros

-   `$options` (pasado por referencia para que pueda modificarse
    dentro de esta función hook) un objeto DataList que establece opciones para
    representar la página. Consulte
    [DataList](/appgini/help/advanced-topics/hooks/DataList-object/) para obtener más
    detalles.
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$args` actualmente no se usa pero está reservado para usos
    futuros.


### Valor devuelto

`true` para representar la página. `false` para cancelar la operación
(lo que podría ser útil para el manejo de errores para mostrar un mensaje de error al
usuario y dejar de mostrar cualquier dato).


### Ejemplo

El siguiente ejemplo comprueba que el usuario conectado pertenece al grupo de administradores
y, en consecuencia, permite la descarga CSV de registros. Si el usuario no es
miembro del grupo de administradores, las descargas CSV están deshabilitadas.

```php
function tablename_init(&$options, $memberInfo, &$args) {

    if($memberInfo['group'] == 'Admins') {
        $options->AllowCSV = 1;
    } else {
        $options->AllowCSV = 0;
    }

    return true;
}
```

> Hay otro ejemplo en la sección [Consejos y tutoriales](/appgini/tips-and-tutorials)
que usa el hook `tablename_init`
para [modificar parte de la consulta de la vista de tabla](/appgini/tips-and-tutorials/customize-tableview-data). Otro
ejemplo usa el hook `tablename_init` para [aplicar un filtro predeterminado a una
tabla](/appgini/tips-and-tutorials/apply-default-filter).



## `tablename_header()`


Llamado antes de mostrar el contenido de la página. Se puede usar para devolver una
plantilla de encabezado personalizada para la tabla. Si abre el archivo
`hooks/tablename.php` generado en un editor de texto (donde `tablename` es el nombre
de la tabla en cuestión), puede ver esta función definida de la siguiente manera:

```php
function tablename_header($contentType, $memberInfo, &$args) {
    $header='';

    switch($contentType) {
        case 'tableview':
            $header='';
            break;

        case 'detailview':
            $header='';
            break;

        case 'tableview+detailview':
            $header='';
            break;

        case 'print-tableview':
            $header='';
            break;

        case 'print-detailview':
            $header='';
            break;

        case 'filters':
            $header='';
            break;
    }

    return $header;
}
```


### Parámetros

-   `$contentType` especifica el tipo de vista que se
    mostrará. Toma uno de los siguientes valores: `tableview`,
    `detailview`, `tableview+detailview`, `print-tableview`,
    `print-detailview` o `filters`.
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$args` actualmente no se usa pero está reservado para usos
    futuros.


### Valor devuelto

Cadena que contiene el código de encabezado HTML. Si está vacío, se usa el
`header.php` predeterminado. Si desea incluir el encabezado predeterminado
además de su encabezado personalizado, incluya el marcador de posición `<%%HEADER%%>`
en la cadena devuelta. Nota: Si tiene un archivo header-extras.php
personalizado (consulte [el contenido de la carpeta `hooks`](/appgini/help/advanced-topics/hooks/folder-contents/) para obtener más
información), no se incluirá en la página si no incluye el
marcador de posición `<%%HEADER%%>` en la cadena de devolución.


### Ejemplo

El siguiente ejemplo muestra la fecha de hoy y la hora actual sobre las
páginas de vista previa de impresión, para que el documento impreso muestre estos datos.
Observe que se incluye el marcador de posición `<%%HEADER%%>` para que el
encabezado original todavía se muestre a los usuarios. El código modificado está en las líneas
18 y 22.

```php
function tablename_header($contentType, $memberInfo, &$args) {
    $header='';

    switch($contentType) {
        case 'tableview':
            $header='';
            break;

        case 'detailview':
            $header='';
            break;

        case 'tableview+detailview':
            $header='';
            break;

        case 'print-tableview':
            $header='<%%HEADER%%><div align="right">'.date('r').'</div>';
            break;

        case 'print-detailview':
            $header='<%%HEADER%%><div align="right">'.date('r').'</div>';
            break;

        case 'filters':
            $header='';
            break;
    }

    return $header;
}
```




## `tablename_footer()`


Llamado después de mostrar el contenido de la página. Se puede usar para devolver una plantilla de pie de página
personalizada para la tabla. Si abre el archivo `hooks/tablename.php` generado
en un editor de texto (donde tablename es el nombre
de la tabla en cuestión), puede ver esta función definida de la siguiente manera:

```php
function tablename_footer($contentType, $memberInfo, &$args) {
    $footer='';

    switch($contentType) {
        case 'tableview':
            $footer='';
            break;

        case 'detailview':
            $footer='';
            break;

        case 'tableview+detailview':
            $footer='';
            break;

        case 'print-tableview':
            $footer='';
            break;

        case 'print-detailview':
            $footer='';
            break;

        case 'filters':
            $footer='';
            break;
    }

    return $footer;
}
```


### Parámetros

-   `$contentType` especifica el tipo de vista que se
    mostrará. Toma uno de los siguientes valores: `tableview`,
    `detailview`, `tableview+detailview`, `print-tableview`,
    `print-detailview` o `filters`.
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$args` actualmente no se usa pero está reservado para usos
    futuros.


### Valor devuelto

Cadena que contiene el código de pie de página HTML. Si está vacío, se usa el
`footer.php` predeterminado. Si desea incluir el pie de página predeterminado
además de su pie de página personalizado, incluya el marcador de posición `<%%FOOTER%%>`
en la cadena devuelta. Nota: Si tiene un archivo footer-extras.php
personalizado (consulte [el contenido de la carpeta `hooks`](/appgini/help/advanced-topics/hooks/folder-contents/) para obtener más
información), no se incluirá en la página si no incluye el
marcador de posición `<%%FOOTER%%>` en la cadena de devolución.


### Ejemplo

Consulte el ejemplo anterior para tablename_header.



## `tablename_before_insert()`


Llamado antes de ejecutar la consulta de inserción. Si abre el archivo
`hooks/tablename.php` generado en un editor de texto (donde tablename es el nombre
de la tabla en cuestión), puede ver esta función definida de la siguiente manera:

```php
function tablename_before_insert(&$data, $memberInfo, &$args) {

    return true;
}
```


### Parámetros

-   `$data` Una matriz asociativa donde las claves son nombres de campo
    y los valores son los valores de datos de campo que se insertarán en el nuevo
    registro. Esta matriz se pasa por referencia para que las modificaciones en ella se apliquen
    a la consulta de inserción.
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$args` no se usaba antes de AppGini 5.90. A partir de AppGini
    5.90, se usa para intercambiar más datos de la siguiente manera:
    -   `$args['error_message']` se puede establecer dentro del hook
        función para mostrar un mensaje de error al usuario en caso de
        devolver `false`.


### Valor devuelto

Un booleano `true` para realizar la operación de inserción, o `false`
para cancelarla.

*A partir de AppGini 5.90*, si devuelve `false`, se puede mostrar un mensaje de error
en cadena (no se permiten etiquetas HTML) a los usuarios pasándolo
a través de `$args['error_message']`.


### Ejemplo 1

En este ejemplo, supongamos que nuestra tabla contiene los campos:
precio_unitario, cantidad y total. Queremos calcular automáticamente el
valor del campo total multiplicando cantidad y precio_unitario.

```php
function tablename_before_insert(&$data, $memberInfo, &$args) {

    $data['total'] = $data['quantity'] * $data['unit_price'];

    return true;
}
```

**Ver también:** [Uso de campos de búsqueda en cálculos](/appgini/help/advanced-topics/hooks/using-lookup-fields-in-calculations/).


### Ejemplo 2 (AppGini 5.90+)

En este ejemplo, supongamos que tenemos una tabla `job_orders`,
y queremos asegurarnos de que el valor del campo `duration` debe ser mayor
que 3. Si no, rechazaremos el registro con un mensaje de error.

```php
function job_orders_before_insert(&$data, $memberInfo, &$args) {

    if($data['duration'] <= 3) {
        $args['error_message'] = 'Error: La duración debe ser mayor que 3.';
        return false;
    }

    return true;
}
```




## `tablename_after_insert()`


Llamado después de ejecutar la consulta de inserción (pero antes de ejecutar la
consulta de inserción de propiedad). Si abre el archivo `hooks/tablename.php` generado
en un editor de texto (donde tablename es el nombre de la tabla en cuestión
), puede ver esta función definida de la siguiente manera:

```php
function tablename_after_insert($data, $memberInfo, &$args) {

    return true;
}
```


### Parámetros

-   `$data` es una matriz asociativa donde las claves son nombres de campo
    y los valores son los valores de datos de campo que se insertaron
    en el nuevo registro. También incluye el elemento
    `$data['selectedID']` que almacena el valor de la clave principal
    para el nuevo registro.
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$args` actualmente no se usa pero está reservado para usos
    futuros.


### Valor devuelto

Un booleano `true` para realizar la operación de inserción de propiedad o
`false` para cancelarla. Advertencia: si se devuelve `false`, el
nuevo registro no tendrá información de propiedad.


### Ejemplo 1

El siguiente ejemplo envía un correo electrónico de notificación a un empleado cuando un
usuario envía un nuevo registro. El correo electrónico contiene los datos del registro.

```php
function tablename_after_insert($data, $memberInfo, &$args) {

    // para componer un mensaje que contenga los datos enviados,
    // necesitamos iterar a través de la matriz $data
    foreach($data as $field => $value) {
        $messageData .= "$field: $value \n";
    }

    sendmail([
        'to' => 'employee@company.com',
        'name' => 'Nombre del destinatario',
        'subject' => 'Un nuevo registro necesita su atención',
        'message' => "El siguiente nuevo registro fue enviado por {$memberInfo['username']}: \n\n" . $messageData
    ]);
    
    return true;
}
```

### Ejemplo 2

El siguiente ejemplo funciona con aplicaciones creadas por AppGini 23.17 o superior.
Utiliza la clase [`WindowMessages`](https://bigprof.com/appgini/help/advanced-topics/hooks/WindowMessages-class)
para mostrar un mensaje personalizado al usuario después de insertar un registro. En
este ejemplo, mostramos una instrucción de muestra para que el usuario la
siga después de haber agregado un nuevo registro a la tabla de pedidos recordándole
que agregue artículos de pedido.

```php
  function orders_after_insert($data, $memberInfo, &$args) {

        WindowMessages::add('Siguiente paso: ¡Agregue artículos de pedido para este pedido!');
        
        return true;
    }
```

Aquí hay un video que muestra cómo funciona el ejemplo anterior:

<video width="100%" controls>
    <source src="https://cdn.bigprof.com/screencasts/show-message-after-insert.mp4" type="video/mp4">
    Su navegador no es compatible con la etiqueta de video.
</video>

## `tablename_before_update()`


Llamado antes de ejecutar la consulta de actualización. Si abre el archivo
`hooks/tablename.php` generado en un editor de texto (donde tablename es el nombre
de la tabla en cuestión), puede ver esta función definida de la siguiente manera:

```php
function tablename_before_update(&$data, $memberInfo, &$args) {

    return true;
}
```


### Parámetros

-   `$data` Una matriz asociativa donde las claves son nombres de campo
    y los valores son los nuevos valores de datos con los que actualizar el campo.
    Esta matriz se pasa por referencia para que las modificaciones en ella se apliquen
    a la consulta de actualización. Esta matriz incluye el elemento
    `$data['selectedID']` que almacena el valor de la clave principal
    para el registro que se va a actualizar.
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$args` no se usaba antes de AppGini 5.90. A partir de AppGini
    5.90, se usa para intercambiar más datos de la siguiente manera:
    -   `$args['error_message']` se puede establecer dentro del hook
        función para mostrar un mensaje de error al usuario en caso de
        devolver `false`.
    -   `$args['old_data']` es una matriz asociativa
        que contiene los valores de registro existentes. Esto es útil para comparar
        los nuevos valores pasados a través del parámetro `$data`
        con los valores almacenados en el registro antes de que se realice la operación de actualización
        real.


### Valor devuelto

`true` para realizar la operación de actualización o `false` para cancelarla.

*A partir de AppGini 5.90*, si devuelve `false`, se puede mostrar un mensaje de error
en cadena (no se permiten etiquetas HTML) a los usuarios pasándolo
a través de `$args['error_message']` (Consulte el ejemplo 2 para
[tablename_before_insert](#tablename_before_insert)).


### Ejemplo

Supongamos que tenemos una tabla de pedidos. Cuando un usuario realiza cambios en un
registro y los guarda, queremos calcular automáticamente el valor del
campo *total* usando los campos *subtotal*, *descuento* y
*impuesto_ventas*, donde el descuento y el impuesto_ventas se almacenan como porcentajes
(es decir, un valor de descuento de 10 significa 10% del subtotal):

```php
function tablename_before_update(&$data, $memberInfo, &$args) {
    
    // calcular el total después de aplicar el descuento
    $data['total'] = $data['subtotal'] * (1 - $data['discount'] / 100);
    
    // calcular el total después de aplicar el impuesto sobre las ventas
    $data['total'] = $data['total'] * (1 + $data['sales_tax'] / 100); 
    
    return true;
}
```



### Otro ejemplo

Supongamos que queremos evitar actualizaciones a cualquier registro en una
tabla en particular que tenga más de 30 días. Para hacerlo,
personalizaríamos los hooks *tablename* _before_update() de esta manera:

```php
function tablename_before_update(&$data, $memberInfo, &$args) {
    
    // obtener la fecha de creación del registro
    $creationDate=sqlValue("select dateAdded from membership_userrecords
        where tableName='tablename' and pkValue='{$data['selectedID']}'");
    
    // si el registro tiene más de 30 días, denegar los cambios
    if($creationDate < strtotime('30 days ago')) return false;
    
    return true;
}
```

*No olvide reemplazar `tablename` en la línea 5 anterior, con el nombre real
de su tabla.*


## `tablename_after_update()`


Llamado después de ejecutar la consulta de actualización y antes de ejecutar la
consulta de actualización de propiedad. Si abre el archivo `hooks/tablename.php` generado
en un editor de texto (donde tablename es el nombre de la tabla en cuestión
), puede ver esta función definida de la siguiente manera:

```php
function tablename_after_update($data, $memberInfo, &$args) {

    return true;
}
```


### Parámetros

-   `$data` es una matriz asociativa donde las claves son nombres de campo
    y los valores son los valores de datos de campo que se insertaron
    en el nuevo registro. También incluye el elemento
    `$data['selectedID']` que almacena el valor de la clave principal
    para el nuevo registro.
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$args` no se usaba antes de AppGini 5.90. A partir de AppGini
    5.90, se usa para intercambiar más datos de la siguiente manera:
    -   `$args['old_data']` es una matriz asociativa
        que contiene los valores de registro antiguos que existían antes de la operación de actualización
        . Esto es útil para comparar los nuevos valores pasados
        a través del parámetro `$data` con los valores antiguos del
        registro que existían antes de la operación de actualización. Podría
        usar esto, por ejemplo, para fines de auditoría.


### Valor devuelto

`true` para realizar la operación de actualización de propiedad o `false` para
cancelarla.


### Ejemplo

Consulte el ejemplo para el hook `tablename_after_insert` anterior.



## `tablename_before_delete()`


Llamado antes de eliminar un registro (y antes de realizar la verificación de registros
secundarios). Si abre el archivo `hooks/tablename.php` generado en un editor de texto
(donde tablename es el nombre de la tabla en cuestión), puede ver
esta función definida de la siguiente manera:

```php
function tablename_before_delete($selectedID, &$skipChecks, $memberInfo, &$args) {

    return true;
}
```


### Parámetros

-   `$selectedID` es el valor de la clave principal del registro que se va a
    eliminar.
-   `$skipChecks` es una bandera pasada por referencia que determina
    si se debe realizar o no la verificación de registros secundarios. Si establece
    `$skipChecks` en `true` dentro de esta función hook, no se realizará ninguna verificación de
    registros secundarios. Si lo establece en `false`, se realizará
    la verificación.
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$args` actualmente no se usa pero está reservado para usos
    futuros.


### Valor devuelto

`true` para realizar la operación de eliminación o `false` para cancelarla.


### Ejemplo

En este ejemplo, asumiremos que nuestra tabla contiene un campo de casilla de verificación
llamado *aprobado*. Queremos permitir la eliminación del registro solo si ese
campo no está marcado (establecido en 0). Si el campo está marcado (establecido en 1),
no se eliminará a menos que el usuario sea miembro del grupo Administradores.

```php
function tablename_before_delete($selectedID, &$skipChecks, $memberInfo, &$args) {
    
    // Realizaremos la verificación 'aprobado' solo si el usuario
    // no es miembro del grupo 'Administradores'.
    
    if($memberInfo['group']!='Admins') {
        $id=makeSafe($SelectedID);
        $approved=sqlValue("select `approved` from `tablename` where `id`='$id'");
        
        // si el registro está aprobado, no permitir su eliminación
        if($approved) return false;
    }
    
    return true;
}
```

Asumimos en el ejemplo anterior que el campo de clave principal de la tabla
se llama *id*. Además, observe en la línea 7 el uso de la función `makeSafe()`,
que prepara las variables para que se usen de forma segura dentro de las consultas SQL.
En la línea 8, usamos la función `sqlValue()` que realiza una consulta SQL
que sabemos que devuelve un solo valor. Es una función de acceso directo que
nos ahorra el esfuerzo de procesar un conjunto de resultados de MySQL.




## `tablename_after_delete()`


Llamado después de eliminar un registro. Si abre el archivo `hooks/tablename.php` generado
en un editor de texto (donde tablename es el nombre de la tabla en cuestión),
puede ver esta función definida de la siguiente manera:

```php
function tablename_after_delete($selectedID, $memberInfo, &$args) {

}
```


### Parámetros

-   `$selectedID` es el valor de la clave principal del registro
    eliminado.
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$args` actualmente no se usa pero está reservado para usos
    futuros.


### Valor devuelto

Ninguno.


### Ejemplo

Este ejemplo registra la fecha y hora en que se eliminó un registro y quién lo eliminó.

```php
function tablename_after_delete($selectedID, $memberInfo, &$args) {
    // archivo de registro
    $logFile='deletes.log';
    
    // intentar abrir el archivo de registro para agregar
    if(!$fp = @fopen($logFile, 'a')) return;
    
    // escribir datos de registro: fecha/hora, nombre de usuario, IP, ID de registro
    $datetime=date('r');
    fwrite($fp, "$datetime,{$memberInfo['username']},{$memberInfo['IP']},$selectedID\n");
    fclose($fp);
}
```




## `tablename_dv()`


Llamado cuando un usuario solicita ver la vista detallada (antes de mostrar
la vista detallada). Si abre el archivo `hooks/tablename.php` generado
en un editor de texto (donde tablename es el nombre de la tabla en cuestión),
puede ver esta función definida de la siguiente manera:

```php
function tablename_dv($selectedID, $memberInfo, &$html, &$args) {

}
```


### Parámetros

-   `$selectedID` El valor de la clave principal del registro seleccionado.
    Se establece en `false` si no se selecciona ningún registro (es decir, la
    vista detallada se mostrará para ingresar un nuevo registro).
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$html` (pasado por referencia para que pueda modificarse
    dentro de esta función hook) el código HTML del formulario listo para ser
    mostrado. Esto podría ser útil para manipular el código antes de
    mostrarlo usando expresiones regulares, etc.
-   `$args` actualmente no se usa pero está reservado para usos
    futuros.


### Valor devuelto

Ninguno.


### Ejemplo

El siguiente ejemplo establece el campo de precio como de solo lectura para usuarios que no son administradores.
El ejemplo demuestra cómo "inyectar" código JavaScript en la
vista detallada para cambiar su comportamiento. Tenga en cuenta que establecer un campo como
de solo lectura a través de JavaScript no es suficiente para evitar su modificación.
Los usuarios avanzados pueden eludir esto fácilmente. Por lo tanto, también debe forzar esto
del lado del servidor, por ejemplo, usando el hook [before_update](#tablename_before_update).

```php
function tablename_dv($selectedID, $memberInfo, &$html, &$args) {
    /* ¿el usuario actual no es un administrador? */
    if($mi['group'] != 'Admins') {
        ob_start();
        ?>
        <script>
            $j(function() {
                $j('#price').prop('readonly', true);
            })
        </script>
        <?php
        $html .= ob_get_clean();
    }
}
```




## `tablename_csv()`


Llamado cuando un usuario solicita descargar datos de la tabla como un archivo CSV (haciendo
clic en el botón GUARDAR CSV). Si abre el archivo `hooks/tablename.php` generado
en un editor de texto (donde tablename es el nombre de la tabla en cuestión),
puede ver esta función definida de la siguiente manera:

```php
function tablename_csv($query, $memberInfo, $args) {

    return $query;
}
```


### Parámetros

-   `$query` contiene la consulta que se ejecutará para devolver
    los datos en el archivo CSV.
-   `$memberInfo` es una matriz que contiene detalles del miembro
    que inició sesión. Consulte
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array/)
    para obtener más detalles.
-   `$args` actualmente no se usa pero está reservado para usos
    futuros.


### Valor devuelto

Una cadena que contiene la consulta que se usará para obtener los datos CSV. Si
se devuelve `false` o vacío, se usa la consulta predeterminada.


### Ejemplo

El siguiente ejemplo modifica la consulta SQL utilizada para limitar los registros
recuperados a solo 10 registros si el usuario que solicita el archivo CSV no es
un administrador.

```php
function tablename_csv($query, $memberInfo, $args) {

    // devolver solo los primeros 10 registros para usuarios que no son administradores.
    if($memberInfo['group']!='Admins') {
        $query.=" limit 10";
    }
    
    return $query;
}
```
