---
title: Hooks globales
linkTitle: Hooks globales
slug: help/advanced-topics/hooks/global-hooks
description: Las funciones de hook globales se definen en el archivo `hooks/__global.php` generado. Este archivo contiene funciones de hook que se llaman cuando un nuevo miembro se registra, cuando un miembro inicia sesión correctamente y cuando un miembro no puede iniciar sesión. También podría definir sus propias funciones PHP aquí y serán visibles para todas las páginas de su aplicación AppGini.
keywords: hooks globales, login_ok, login_failed, member_activity, sendmail_handler, child_records_config
---

# Hooks globales

Las funciones de hook globales se definen en el archivo `hooks/__global.php` generado. Este archivo contiene funciones de hook que se llaman cuando un nuevo miembro se registra, cuando un miembro inicia sesión correctamente y cuando un miembro no puede iniciar sesión. También podría definir sus propias funciones PHP aquí y serán visibles para todas las páginas de su aplicación AppGini.

_Las siguientes funciones de hook se definen en este archivo:_

* [`login_ok()`](#login_ok)
* [`login_failed()`](#login_failed)
* [`member_activity()`](#member_activity)
* [`sendmail_handler()`](#sendmail_handler)
* [`child_records_config()`](#child_records_config)

## `login_ok()`

Esta función de hook se llama cuando un miembro inicia sesión correctamente. Se puede usar, por ejemplo, para redirigir a los miembros a páginas específicas en lugar de la página de inicio, o para guardar un registro de la actividad de los miembros, etc. Si abre el archivo `hooks/__global.php` generado en un editor de texto, puede ver esta función definida de la siguiente manera:

```php
function login_ok($memberInfo, &$args) {
 
    return '';
}
```

### Parámetros:

*   `$memberInfo` es una matriz que contiene detalles del miembro que inició sesión. Consulte [`memberInfo`](/appgini/help/advanced-topics/hooks/memberInfo-array/) para obtener más detalles.
*   `$args` actualmente no está implementado pero está reservado para uso futuro.

### Valor devuelto:

Una cadena que contiene la URL a la que redirigir al miembro. Puede ser una URL relativa o absoluta. Si la cadena de devolución está vacía, el miembro es redirigido a la página de inicio (`index.php`), que es el comportamiento predeterminado.


### Ejemplo:

Agreguemos código para guardar un registro de la actividad de inicio de sesión de los miembros. Cada vez que un miembro inicia sesión, registraremos su nombre de usuario, dirección IP, fecha y hora de inicio de sesión en un archivo de registro. Así es como se ve la función de hook después de agregar este código:

```php
function login_ok($memberInfo, &$args) {
    // el archivo de registro donde guardaremos la actividad de los miembros
    $logFile = 'members.log';
 
    // los detalles del miembro que guardaremos en el archivo
    $username = $memberInfo['username'];
    $ip = $memberInfo['IP'];
    $date = date('m/d/Y');
    $time = date('h:i:s a');
 
    // abrir el archivo de registro y agregar los detalles de inicio de sesión del miembro
    file_put_contents($logFile, "$date,$time,$username,$ip\n", FILE_APPEND);
 
    return '';
}
```

## `login_failed()`

Esta función de hook se llama cuando falla un intento de inicio de sesión. Se puede usar, por ejemplo, para registrar errores de inicio de sesión. Si abre el archivo `hooks/__global.php` generado en un editor de texto, puede ver esta función definida de la siguiente manera:

```php
function login_failed($attempt, &$args) {
 
}
```

### Parámetros:

*   `$attempt` es una matriz asociativa que contiene detalles del intento de inicio de sesión fallido. Contiene las siguientes claves:
    * `username`: el nombre de usuario ingresado durante el intento de inicio de sesión.
    * `password`: la contraseña ingresada durante el intento de inicio de sesión.
    * `IP`: la dirección IP del cliente que intenta iniciar sesión.
*   `$args` actualmente no está implementado pero está reservado para uso futuro.

### Valor devuelto:

Ninguno.

### Ejemplo:

Para notificar al administrador cuando un usuario no puede iniciar sesión, podemos agregar este código a la función `login_failed()`:

```php
function login_failed($attempt, &$args){
    // correo electrónico del administrador
    $adminEmail = 'admin@domain.com';
 
    // ¿alguien intenta iniciar sesión como administrador?
    if($attempt['username'] == 'admin'){
 
        // enviar el correo electrónico
        @mail(
            $adminEmail, // destinatario del correo electrónico
            "Intento de inicio de sesión fallido", // asunto del correo electrónico
            "Alguien desde {$attempt['IP']} intentó iniciar sesión ".
            "como administrador usando la contraseña {$attempt['password']}.", // mensaje
            "From: $adminEmail"
        );
    }
}
```

## `member_activity()`

Esta función de hook se llama cuando un nuevo miembro se registra. Si abre el archivo `hooks/__global.php` generado en un editor de texto, puede ver esta función definida de la siguiente manera:

```php
function member_activity($memberInfo, $activity, &$args){
    switch($activity){
        case 'pending':
            break;
 
        case 'automatic':
            break;
 
        case 'profile':
            break;
 
        case 'password':
            break;
 
    }
}
```

### Parámetros:

*   `$memberInfo` es una matriz asociativa que contiene detalles del miembro que se registró. Consulte [`memberInfo`](/appgini/help/advanced-topics/hooks/memberInfo-array/) para obtener más detalles.
*   `$activity` es una cadena que indica el tipo de actividad. Puede ser uno de los siguientes valores:
    * `pending`: el miembro se registró pero su cuenta está pendiente de aprobación por parte del administrador.
    * `automatic`: el miembro se registró y su cuenta se aprueba automáticamente.
    * `profile`: el miembro actualizó su perfil.
    * `password`: el miembro cambió su contraseña.
*   `$args` actualmente no está implementado pero está reservado para uso futuro.

### Valor devuelto:

Ninguno.

### Ejemplo:

Este ejemplo envía un correo electrónico de bienvenida a los nuevos usuarios que fueron aprobados automáticamente y un correo electrónico de "espere por favor" para los nuevos usuarios pendientes de aprobación.

```php
function member_activity($memberInfo, $activity, &$args){
    switch($activity){
        case 'pending':
            // enviar correo electrónico de "espere por favor" al nuevo usuario
            @mail(
                $memberInfo['email'], // destinatario del correo electrónico
                "¡Gracias por registrarse en nuestro sitio web!", // asunto
                 
                "Estimado {$memberInfo['username']}, \n\n".
                "Revisaremos y aprobaremos su nueva cuenta en unas pocas horas.\n\n".
                "Gracias.", // mensaje
 
                "From: support@domain.com" // la dirección "De" que verá el usuario
            );
            break;
 
        case 'automatic':
            // enviar correo electrónico de "bienvenida" al nuevo usuario
            @mail(
                $memberInfo['email'], // destinatario del correo electrónico
                "¡Gracias por registrarse en nuestro sitio web!", // asunto
                 
                "Estimado {$memberInfo['username']}, \n\n".
                "Ahora puede iniciar sesión en nuestro sitio web desde esta página:\n".
                "http://www.domain.com/appgini\n\n".
                "Gracias.", // mensaje
 
                "From: support@domain.com" // la dirección "De" que verá el usuario
            );
            break;
 
        case 'profile':
            break;
 
        case 'password':
            break;
 
    }
}
```

## `sendmail_handler()`

Esta función de hook se llama cuando AppGini envía un correo electrónico utilizando la función `sendmail()`. Se puede utilizar para modificar el correo electrónico antes de que se envíe. Si abre el archivo `hooks/__global.php` generado en un editor de texto, puede ver esta función definida de la siguiente manera:

```php
function sendmail_handler(&$pm) {

}
```

### Parámetros:

*   `$pm` es un objeto PHPMailer, pasado por referencia. Consulte el [proyecto PHPMailer en Github](https://github.com/PHPMailer/PHPMailer) para obtener más detalles.

### Valor devuelto:

Ninguno.

## `child_records_config()`

Esta función de hook se agregó en AppGini 22.14 y se puede usar para modificar la configuración predeterminada de
la [sección de registros secundarios en la vista detallada](/appgini/help/working-with-projects/understanding-lookup-fields/#parent-children-settings).

Si abre el archivo `hooks/__global.php` generado en un editor de texto, puede ver esta función definida de la siguiente manera:

```php
function child_records_config($childTable, $childLookupField, &$config) {
 
}
```

### Parámetros:

*   `$childTable` es el nombre de la tabla secundaria.
*   `$childLookupField` es el nombre del campo de búsqueda en la tabla secundaria.
*   `$config` es una matriz asociativa que contiene la configuración para mostrar los registros secundarios del usuario actual, pasada por referencia. La configuración predeterminada se almacena en la matriz `$pcConfig` definida en el archivo `parent-children.php` generado.

### Valor devuelto:

Ninguno.
