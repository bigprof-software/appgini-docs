---
title: Contenido de la carpeta `hooks` generada
linkTitle: La carpeta `hooks`
slug: help/advanced-topics/hooks/folder-contents
description: La carpeta hooks es donde debe colocarse todo su código definido por el usuario. AppGini genera los archivos hook en esta carpeta solo si no existen. AppGini no sobrescribe estos archivos más tarde. Por lo tanto, su código personalizado se conserva de forma segura sin importar cuántas veces regenere el código de su proyecto.
keywords: hooks, carpeta, contenido, personalización, código, hooks globales, hooks específicos de tabla, links-home, links-navmenu, footer-extras, header-extras
---

# Contenido de la carpeta `hooks` generada

![contenido de la carpeta hooks](https://cdn.bigprof.com/images/hooks-folder.png "contenido de la carpeta hooks")

La carpeta `hooks` es donde debe colocarse todo su código definido por el usuario. AppGini genera los archivos hook en esta carpeta solo si no existen. AppGini no sobrescribe estos archivos más tarde. Por lo tanto, su código personalizado se conserva de forma segura sin importar cuántas veces regenere el código de su proyecto.

## Contenido de la carpeta `hooks`

### `__global.php`

Este archivo contiene funciones hook que se llaman cuando un nuevo miembro se registra, cuando un miembro inicia sesión correctamente y cuando un miembro no puede iniciar sesión. [_Leer más_](/appgini/help/advanced-topics/hooks/global-hooks/).


### `__bootstrap.php`

Este archivo, si está presente, se incluye al principio de cada página de su aplicación (incluida la página de configuración, el área de administración y, por supuesto, el área de usuarios). Puede usarlo para definir funciones, clases o constantes globales que desee que estén disponibles en todas las páginas de su aplicación. También podría anular cualquiera de las constantes definidas en el archivo `definitions.php` generado aquí. Por ejemplo, puede mostrar los menús de navegación en la página de inicio agregando este código a `__bootstrap.php`:

```php
define('HOMEPAGE_NAVMENUS', true);
```

#### Modificar el comportamiento de la sesión mediante la función `session_options` en `__bootstrap.php`

Otro caso de uso común para el archivo `__bootstrap.php` es modificar el comportamiento de la sesión. Para ello, defina una función `session_options` en este archivo de la siguiente manera:

```php
function session_options(&$options) {
    // cambiar el comportamiento de la sesión aquí
    // ejemplo: establecer la vida útil de la sesión en 1 semana
    $options['cookie_lifetime'] = 60 * 60 * 24 * 7; // 1 semana
}
```

En el ejemplo anterior, establecemos la vida útil de la sesión en 1 semana. Otras opciones de sesión que puede establecer se enumeran y explican en [php.net/manual/en/session.configuration.php](https://www.php.net/manual/en/session.configuration.php). Elimine el prefijo inicial `session.` del nombre de la opción al configurarla en la función `session_options`. Por ejemplo, para establecer la opción `session.gc_maxlifetime`, debe establecer `$options['gc_maxlifetime'] = ...`.
    
### `{tablename}.php`

Para cada tabla de su proyecto, se crea un archivo hook con el mismo nombre que el nombre de la tabla. Este archivo contiene funciones hook que se llaman cuando se agrega un nuevo registro, cuando se edita un registro, cuando se elimina un registro, etc. Estos hooks son específicos de la tabla. Es por eso que cada tabla en su proyecto tiene su propio archivo hook. [_Leer más_](/appgini/help/advanced-topics/hooks/table-specific-hooks/)
      

### `links-home.php`

Puede agregar enlaces personalizados en la página de inicio de su aplicación agregándolos a este archivo. El formato para cada enlace es:

```php
$homeLinks[] = [
    'url' => 'ruta/al/enlace',
    'title' => 'Título del enlace',
    'description' => 'Texto del enlace',
    'groups' => ['grupo1', 'grupo2'],
    'grid_column_classes' => '',
    'panel_classes' => '',
    'link_classes' => '',
    'icon' => 'ruta/al/icono',
    'table_group' => ''
];
```

*Donde:*

* `url` es la ruta al enlace. Puede ser una ruta relativa dentro de su aplicación o una URL externa.
* `title` es el título del enlace tal como aparece en la página de inicio.
* `description` es el texto que aparece debajo del título. Se permite HTML.
* `groups` define los grupos autorizados a ver este enlace. Establezca en `['*']` si desea mostrar el enlace a todos los grupos.
* `grid_column_classes` (opcional) enumera las clases CSS que se aplicarán al bloque de enlaces para controlar su ancho en diferentes tamaños de pantalla. Clases válidas de ejemplo: `col-lg-4`, `col-sm-6`, ... etc. Ver: [getbootstrap.com/css/#grid](https://getbootstrap.com/css/#grid).
* `panel_classes` (opcional) enumera las clases CSS que se aplicarán al panel. Clases válidas de ejemplo: `panel-warning`, `panel-success`, ... etc. Ver: [getbootstrap.com/components/#panels](https://getbootstrap.com/components/#panels).
* `link_classes` (opcional) enumera las clases CSS que se aplicarán al enlace. Clases válidas de ejemplo: `btn-danger`, `btn-primary`, ... etc. Ver: [getbootstrap.com/css/#buttons](https://getbootstrap.com/css/#buttons).
* `icon` es la ruta a un icono opcional para usar con el enlace.
* `table_group` es el ***nombre*** del grupo de tablas al que desea agregar el enlace (si está utilizando grupos de tablas). El valor debe establecerse en el nombre exacto del grupo. Si el nombre del grupo de tablas contiene caracteres no latinos, debe convertirlos a entidades html. Por ejemplo, el carácter ૫ debe escribirse como `&#2795;`

### `links-navmenu.php`

Puede agregar enlaces personalizados al menú de navegación (menú "Saltar a") de su aplicación agregándolos a este archivo. El formato para cada enlace es:

```php
$navLinks[] = [
    'url' => 'ruta/al/enlace',
    'title' => 'Título del enlace',
    'groups' => ['grupo1', 'grupo2'],
    'icon' => 'ruta/al/icono',
    'table_group' => 0
];
```

*Donde:*

*   `groups` define los grupos autorizados a ver este enlace. Establezca en `['*']` si desea mostrar el enlace a todos los grupos.
*   `icon` es la ruta a un icono opcional para usar con el enlace.
*   `table_group` es el ***índice*** del grupo de tablas, el valor predeterminado es `0` (primer grupo de tablas).

### `footer-extras.php` y `header-extras.php`

Ambos archivos le permiten insertar contenido adicional en el pie de página y el encabezado (respectivamente) de todas las páginas del área de usuario.
Puede agregar código HTML, CSS, JavaScript y/o PHP en esos dos archivos, siempre que ajuste cada tipo de código en las etiquetas apropiadas.

Es decir, para agregar CSS personalizado, insértelo dentro de las etiquetas `<style>`. Para agregar JavaScript personalizado, insértelo dentro de las etiquetas `<script>`.
Para agregar código PHP personalizado, insértelo dentro de las etiquetas `<?php ... ?>`. Para HTML, simplemente insértelo tal cual.

> Al insertar código JavaScript que utiliza jQuery, asegúrese de envolver su código en una función `ready` de jQuery. Por ejemplo:

```javascript
<script>
    $j(() => {
        // su código aquí
    });
</script>
```

### `{tablename}-dv.js`

Este archivo, si está presente, se incluye en la vista detallada de la tabla especificada. Puede usarlo para agregar código JavaScript personalizado a la vista detallada de la tabla especificada.

### `{tablename}-tv.js`

Este archivo, si está presente, se incluye en la vista de tabla de la tabla especificada. Puede usarlo para agregar código JavaScript personalizado a la vista de tabla de la tabla especificada.

### `index.html`

Este archivo no debe editarse. Simplemente redirige a los visitantes que intentan acceder a la carpeta `hooks` a la página principal.
