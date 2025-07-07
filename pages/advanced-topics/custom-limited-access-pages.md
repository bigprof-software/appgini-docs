---
title: Añadir páginas e informes personalizados de acceso limitado
linkTitle: Páginas personalizadas
slug: help/advanced-topics/custom-limited-access-pages
description: Aprenda a crear páginas e informes personalizados en su aplicación AppGini y a limitar su acceso a usuarios autenticados.
keywords: páginas personalizadas, informes personalizados, acceso limitado, grupos de usuarios, permisos, hooks, getMemberInfo
---

# Añadir páginas e informes personalizados de acceso limitado

En la mayoría de las aplicaciones, es posible que necesite crear páginas personalizadas adicionales además de las generadas por AppGini. Por ejemplo, puede que desee añadir algunos informes, gráficos, paneles de control, formularios especiales, etc. En este artículo, explicaremos cómo puede crear una página adicional y limitar el acceso a ella a los usuarios autenticados. También explicaremos cómo integrarla como parte de su aplicación AppGini.

Probablemente desee alcanzar 3 objetivos al integrar nuevas páginas personalizadas en su aplicación AppGini:

1.  **Controlar el acceso a la página.** Desea que solo los usuarios autenticados (o quizás solo *algunos* usuarios autenticados) puedan acceder a la página, mientras que otros son redirigidos a la página de inicio o al formulario de inicio de sesión.
2.  **Integrar la apariencia de la página en su aplicación.** Es decir, desea que esa página personalizada muestre el mismo menú de navegación superior que se muestra en las otras páginas de su aplicación y que tenga el mismo tema.
3.  **Enlazar a la página desde otras páginas** para que los usuarios de su aplicación puedan encontrarla fácilmente. Es posible que desee enlazarla desde la página de inicio y/o desde el menú desplegable "Saltar a" en la barra de navegación superior.

Cubriremos todos los puntos anteriores en este artículo.

### Controlar el acceso a su página personalizada

AppGini admite un sistema de membresía basado en grupos de usuarios.

1.  Puede conceder algunos permisos a un grupo (o algunos grupos), y todos los usuarios de ese grupo obtendrán automáticamente esos permisos.
2.  Alternativamente, puede conceder algunos permisos solo a un usuario específico en lugar de a todo un grupo.
3.  Otro enfoque es conceder algunos permisos a cualquier usuario autenticado, independientemente del grupo al que pertenezca.

Veamos cómo aplicar cualquiera de estos enfoques a su página personalizada.

En primer lugar, creemos un nuevo archivo en la carpeta `hooks` dentro de la carpeta de su aplicación generada por AppGini. Llamémoslo `example.php`. Ahora, abra ese archivo en su editor de texto y pegue el siguiente código, luego guárdelo.

```php
<?php
    define('PREPEND_PATH', '../');
    $hooks_dir = __DIR__;
    include("$hooks_dir/../lib.php");
```

El código anterior le permite utilizar las funciones proporcionadas por AppGini en su página personalizada, incluida la función [`getMemberInfo()`](/appgini/help/advanced-topics/hooks/memberInfo-array/) que puede utilizar para comprobar los permisos. Veamos cómo implementar cada uno de los métodos de acceso anteriores.

#### Dónde colocar sus páginas personalizadas

**Recomendamos encarecidamente colocar sus páginas personalizadas en la carpeta `hooks` o en una subcarpeta de la misma. Colocar sus archivos personalizados fuera de la carpeta `hooks`, en la carpeta principal de la aplicación, dificultaría el mantenimiento de sus archivos personalizados cuando regenere su aplicación con AppGini.**

Sin embargo, en algunos casos, es posible que necesite colocar sus archivos personalizados fuera de la carpeta principal de la aplicación. Por ejemplo, puede que desee crear una página de acceso público que no requiera autenticación, sin exponer toda su aplicación al público. En este caso, debe modificar la ruta de la cookie de sesión para incluir la carpeta que contiene sus archivos personalizados. Esto es importante para permitir que las páginas personalizadas fuera de la carpeta principal de la aplicación compartan la misma sesión con el resto de la aplicación. De lo contrario, los usuarios que accedan a las páginas personalizadas se considerarán usuarios invitados.

Tomemos un ejemplo para ilustrar esto. Suponga que tiene una página personalizada llamada `custom-page.php` que desea colocar en la carpeta principal de su aplicación AppGini. Y la aplicación se encuentra en una carpeta llamada `myapp`. La estructura de carpetas se vería algo así, suponiendo que su aplicación se encuentra en `/var/www/html/myapp`:

```
/var/www/html/
    myapp/
        hooks/
        ...
    custom-page.php
```

Para permitir que `custom-page.php` comparta la misma sesión con el resto de la aplicación, debe crear un archivo llamado `__bootstrap.php` en la carpeta `myapp/hooks` si aún no existe. Añada el siguiente código a `__bootstrap.php`:

```php
<?php // si aún no tiene esta línea, añádala al principio del archivo

function session_options(&$options) {
	$cookie_path = '/' . trim(config('appURI'), '/');
	// eliminar el último subdirectorio de la ruta de la cookie
	$cookie_path = substr($cookie_path, 0, strrpos($cookie_path, '/'));
	$options['cookie_path'] = $cookie_path;
}
```

El código anterior modifica la ruta de la cookie de sesión para incluir la carpeta principal de su aplicación. De esta manera, la cookie de sesión se compartirá entre su página personalizada y el resto de la aplicación.

#### Conceder acceso a uno o más grupos

En caso de que desee que todos los usuarios que pertenecen a los grupos "Admins" y "Data entry" (por ejemplo) puedan acceder a su página personalizada, editemos el código para que quede así:

```php
<?php
    define('PREPEND_PATH', '../');
    $hooks_dir = __DIR__;
    include("$hooks_dir/../lib.php");
     
    /* conceder acceso a los grupos 'Admins' y 'Data entry' */
    $mi = getMemberInfo();
    if(!in_array($mi['group'], ['Admins', 'Data entry'])) {
        echo "Acceso denegado";
        exit;
    }
 
    echo "¡Puede acceder a esta página!";
```

Si intenta acceder a la página anterior desde su navegador mientras está conectado como cualquier usuario de los grupos 'Admins' o 'Data entry', debería ver el mensaje _¡Puede acceder a esta página!_ ... De lo contrario, debería ver el error _Acceso denegado_.

#### Conceder acceso a uno o más usuarios

Otro caso es cuando desea que uno o más usuarios específicos, en lugar de todo un grupo, accedan a la página. Seguiremos utilizando la función getMemberInfo() pero la comprobación será ligeramente diferente:

```php
<?php
    define('PREPEND_PATH', '../');
    $hooks_dir = __DIR__;
    include("$hooks_dir/../lib.php");
     
    /* conceder acceso a los grupos 'Admins' y 'Data entry' */
    $mi = getMemberInfo();
    if(!in_array($mi['username'], ['john.doe', 'jane.doe'])) {
        echo "Acceso denegado";
        exit;
    }
 
    echo "¡Puede acceder a esta página!";
```

Si intenta acceder a la página anterior desde su navegador mientras está conectado como el usuario 'john.doe' o 'jane.doe', debería ver el mensaje _¡Puede acceder a esta página!_ ... De lo contrario, debería ver el error _Acceso denegado_.

#### Conceder acceso a cualquier usuario conectado

Otro caso es conceder acceso a su página a todos los usuarios conectados. Aquí está el código para este escenario.

```php
<?php
    define('PREPEND_PATH', '../');
    $hooks_dir = __DIR__;
    include("$hooks_dir/../lib.php");
     
    /* conceder acceso a todos los usuarios conectados */
    $mi = getMemberInfo();
    if(!$mi['username'] || $mi['username'] == 'guest') {
        echo "Acceso denegado";
        exit;
    }
 
    echo "¡Puede acceder a esta página!";
```

Lo anterior denegará el acceso a los usuarios anónimos y permitirá el acceso a cualquier usuario conectado. Si ha cambiado el nombre de usuario anónimo predeterminado de 'guest' en el área de administración, debe actualizarlo en la línea 9 anterior.

#### Integrar la apariencia de la página en su aplicación AppGini

Después de controlar el acceso a su página personalizada, el siguiente paso es personalizar su apariencia para que coincida con el resto de las páginas de la aplicación. Esto se puede lograr muy fácilmente incluyendo los archivos de cabecera y pie de página de la siguiente manera.

```php
<?php
    define('PREPEND_PATH', '../');
    $hooks_dir = __DIR__;
    include("$hooks_dir/../lib.php");
 
    include_once("$hooks_dir/../header.php");
 
    /* conceder acceso a todos los usuarios conectados */
    $mi = getMemberInfo();
    if(!$mi['username'] || $mi['username'] == 'guest') {
        echo "Acceso denegado";
        exit;
    }
 
    echo "¡Puede acceder a esta página!";
 
    include_once("$hooks_dir/../footer.php");
```

#### Funciones útiles para usar en sus páginas personalizadas

AppGini proporciona una serie de funciones útiles que puede utilizar en sus páginas personalizadas. Por ejemplo, puede utilizar la función [`sql()`](programming-reference/useful-php-functions.md#sql) para ejecutar consultas SQL, la función [`sendmail()`](programming-reference/useful-php-functions.md#sendmail) para enviar correos electrónicos y la función [`sqlValue()`](programming-reference/useful-php-functions.md#sqlValue) para recuperar un único valor de la base de datos. Puede encontrar más detalles sobre estas funciones en la página [Funciones PHP útiles de AppGini](programming-reference/useful-php-functions.md).

#### Enlazar a la página desde otras páginas

Finalmente, desea que los usuarios puedan llegar fácilmente a su página. AppGini facilita la adición de enlaces a la página de inicio y/o al menú de navegación. Para ello, todo lo que necesita hacer es [añadir unas pocas líneas a los archivos "hooks/links-home.php" y/o "hooks/links-navmenu.php"](/appgini/help/advanced-topics/hooks/folder-contents/).

> **¡Consejo!** Si planea añadir muchas páginas personalizadas a su aplicación, puede que no sea muy práctico colocar enlaces a todas ellas directamente en el menú de navegación o en la página de inicio. Un enfoque más organizado en este caso es crear una página que liste los enlaces personalizados y añadir un enlace a esa página en lugar de a cada página personalizada.

#### Si está utilizando versiones de AppGini anteriores a la 5.90

Si está utilizando versiones de AppGini anteriores a la 5.90, necesita `incluir` archivos de idioma al crear una página personalizada. En todos los fragmentos de código anteriores, cambie esta parte del código:

```php
include("$hooks_dir/../lib.php");
```

a:

```php
include("$hooks_dir/../defaultLang.php");
include("$hooks_dir/../language.php");
include("$hooks_dir/../lib.php");
```
