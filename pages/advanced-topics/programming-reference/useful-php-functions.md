---
title: Funciones PHP útiles de AppGini para usar en código personalizado
linkTitle: Funciones PHP de AppGini
slug: help/advanced-topics/programming-reference/useful-php-functions
keywords: Funciones PHP de AppGini, sql(), sendmail(), PHPMailer, sendmail_handler(), sqlValue()
description: AppGini proporciona una serie de funciones PHP útiles que puede utilizar en su código personalizado para interactuar con su base de datos y realizar diversas tareas.
---

# Funciones PHP útiles de AppGini para usar en código personalizado

> **Nota**: Esta página es un trabajo en progreso. Pronto agregaremos más funciones y ejemplos.

AppGini proporciona una serie de funciones PHP útiles que puede utilizar en su código personalizado para interactuar con su base de datos y realizar diversas tareas. Aquí hay una lista de algunas de estas funciones:

## `sql()`

Esta función se utiliza para ejecutar una consulta SQL.

### Sintaxis

```php
$options = [];
$result = sql($query, $options);
```

### Parámetros

- `$query` (string): La consulta SQL a ejecutar.
- **`$options`** (array): Una matriz asociativa de opciones, pasada por referencia. Esta matriz se utiliza para pasar opciones adicionales a la función, pero también puede devolver mensajes de error si la consulta falla. Se admiten las siguientes opciones:
  - `silentErrors`: Si se establece en `true`, la función no mostrará un mensaje de error si la consulta falla. El valor predeterminado es `true`.
  - `noSlowQueryLog`: Si se establece en `true`, la función no registrará las consultas lentas. El valor predeterminado es `false`.
  - `noErrorQueryLog`: Si se establece en `true`, la función no registrará errores. El valor predeterminado es `false`.

> **Nota**: Se puede acceder a las consultas lentas y con errores desde la página de registro de consultas en el área de administración (Menú Utilidades > Registro de consultas).

### Valor devuelto

La función devuelve un objeto de conjunto de resultados en caso de éxito, o `false` en caso de error. El objeto de conjunto de resultados se puede utilizar para obtener filas devueltas por la consulta utilizando las funciones `db_fetch_assoc()`, `db_fetch_row()` o `db_fetch_array()`.

### Ejemplo

```php
$options = ['silentErrors' => true];
$result = sql("SELECT * FROM `books`", $options);
if($result === false) {
  echo 'Error al ejecutar la consulta: ' . $options['error'];
} else {
  while($row = db_fetch_assoc($result)) {
    echo $row['title'] . '<br>';
  }
}
```

## `sendmail()`

Esta función se utiliza para enviar correos electrónicos utilizando la [biblioteca PHPMailer](https://github.com/PHPMailer/PHPMailer/) incluida como parte de los archivos generados de las aplicaciones AppGini. Admite el envío de correos electrónicos a destinatarios únicos o múltiples, y puede usar SMTP para enviar correos electrónicos, si está configurado a través de la página de Configuración de administración en el área de Administración. La función también admite agregar destinatarios CC, CCO y manejar contenido HTML en el cuerpo del correo electrónico.

### Parámetros

- **`$mail`** (array): Una matriz asociativa que contiene los detalles del correo electrónico. Se admiten las siguientes claves:
    - `to` (string|array): La dirección de correo electrónico del destinatario o una matriz de destinatarios en el formato `[[email, name]]`.
    - `name` (string, opcional): El nombre del destinatario (se usa si 'to' es una cadena).
    - `subject` (string, opcional): El asunto del correo electrónico.
    - `message` (string, opcional): El cuerpo del correo electrónico.
    - `cc` (array, opcional): Una matriz de destinatarios CC en el formato `[[email, name]]`.
    - `bcc` (array, opcional): Una matriz de destinatarios CCO en el formato `[[email, name]]`.
    - `debug` (int, opcional): Nivel de depuración para SMTP (0 a 4).
    - `tag` (mixed, opcional): Etiqueta personalizada para pasar a la [función hook `sendmail_handler`](../hooks/global-hooks.md#sendmail_handler).

### Valor devuelto

- `true` en caso de éxito.
- (string) que contiene el mensaje de error en caso de fallo.

### Ejemplos

#### Envío de un solo correo electrónico

```php
$result = sendmail([
    'to' => 'destinatario@ejemplo.com',
    'name' => 'Nombre del destinatario',
    'subject' => 'Correo electrónico de prueba',
    'message' => 'Este es un correo electrónico de prueba.'
]);

if ($result === true) {
    echo "¡Correo electrónico enviado con éxito!";
} else {
    echo "Error al enviar el correo electrónico: $result";
}
```

#### Envío de un correo electrónico a múltiples destinatarios

```php
$result = sendmail([
    'to' => [
        ['destinatario1@ejemplo.com', 'Destinatario Uno'],
        ['destinatario2@ejemplo.com', 'Destinatario Dos']
    ],
    'subject' => 'Correo electrónico de prueba para múltiples destinatarios',
    'message' => 'Este es un correo electrónico de prueba para múltiples destinatarios.'
]);

if ($result === true) {
    echo "¡Correo electrónico enviado con éxito!";
} else {
    echo "Error al enviar el correo electrónico: $result";
}
```

#### Envío de un correo electrónico con archivos adjuntos

Para manejar archivos adjuntos, puede usar la [función hook `sendmail_handler`](../hooks/global-hooks.md#sendmail_handler),
que se define en el archivo `hooks/__global.php`. Puede modificar la función `sendmail_handler` para agregar el manejo de archivos adjuntos de la siguiente manera:

```php
function sendmail_handler(&$pm) {
    // Comprobar si se proporcionan archivos adjuntos en la etiqueta
    if (!empty($pm->tag['attachments'])) {
        foreach ($pm->tag['attachments'] as $attachment) {
            $pm->addAttachment($attachment);
        }
    }
}
```

Luego puede enviar un correo electrónico con archivos adjuntos de la siguiente manera:

```php
$result = sendmail([
    'to' => 'destinatario@ejemplo.com',
    'name' => 'Nombre del destinatario',
    'subject' => 'Correo electrónico de prueba con archivo adjunto',
    'message' => 'Este es un correo electrónico de prueba con un archivo adjunto.',
    'tag' => [
        'attachments' => [
            '/ruta/a/adjunto1.pdf',
            '/ruta/a/adjunto2.jpg'
        ]
    ]
]);

if ($result === true) {
    echo "¡Correo electrónico enviado con éxito!";
} else {
    echo "Error al enviar el correo electrónico: $result";
}
```

## `sqlValue()`

Esta función se utiliza para ejecutar una consulta SQL y devolver un solo valor de la primera fila del conjunto de resultados. Esta es una forma muy conveniente de ejecutar rápidamente una consulta y obtener un solo valor, sin tener que iterar a través del conjunto de resultados.

### Sintaxis

```php
$value = sqlValue($query, $error);
```

### Parámetros

- **`$query`** (string): La consulta SQL a ejecutar.
- **`$error`** (string, opcional): Una variable pasada por referencia para almacenar un mensaje de error si la consulta falla. Si la consulta tiene éxito, esta variable no se modificará.

### Valor devuelto
- La función devuelve el valor de la primera fila del conjunto de resultados, o `false` si la consulta falla o no devuelve filas. En caso de fallo, la variable `$error` (si se proporciona) contendrá el mensaje de error.

### Ejemplos

#### Uso básico sin manejo de errores

```php
$bookCount = sqlValue("SELECT COUNT(*) FROM `books`");
echo "Número total de libros: $bookCount";
```

#### Uso con manejo de errores

```php
$error = '';
$bookCount = sqlValue("SELECT COUNT(*) FROM `books`", $error);
if ($bookCount === false) {
    echo "Error al obtener el recuento de libros: $error";
} else {
    echo "Número total de libros: $bookCount";
}
```
