---
title: Clase WindowMessages
linkTitle: Clase WindowMessages
slug: help/advanced-topics/hooks/WindowMessages-class
---

# Clase WindowMessages

Una clase para mostrar mensajes al usuario en la próxima carga de página.

Para agregar un mensaje, use el método `WindowMessages::add()`:

```php
WindowMessages::add('¡Hola mundo!', 'alert alert-success');
```

El primer parámetro es el mensaje a mostrar, y el segundo parámetro
son las clases CSS para aplicar al contenedor `<div>` del mensaje. El
segundo parámetro es opcional, y por defecto es `alert alert-info`
si no se especifica.

El/los mensaje(s) se mostrarían en la próxima carga de página, y son
específicos de la ventana actual del navegador. Es decir, si tiene múltiples
ventanas del navegador abiertas, cada ventana tendrá su propio conjunto de mensajes.

Para agregar un mensaje descartable, use el
método `WindowMessages::addDismissable()`:

```php
WindowMessages::addDismissable('¡Hola mundo!', 'alert alert-success');
```

Los parámetros son los mismos que el método `WindowMessages::add()`.

### ¿Cómo funciona?

La clase `WindowMessages` funciona asignando un ID único a cada
ventana del navegador. El ID se envía con cada solicitud, y los mensajes
se almacenan en la sesión bajo ese ID. Cuando se carga la página, los
mensajes se recuperan de la sesión y se muestran.

La parte más significativa de esto es que los mensajes se asignan a
la ventana actual del navegador, y no a la sesión actual. Esto significa que
si tiene múltiples ventanas del navegador abiertas, cada ventana tendrá su propio
conjunto de mensajes.

Esto es particularmente útil después de insertar un nuevo registro, donde el usuario
es redirigido a otra página. En ese caso, si desea mostrar
algún mensaje al usuario, puede usar la clase `WindowMessages`
para hacerlo, y el mensaje se mostrará en la página redirigida. Vea
el ejemplo en la documentación del hook [`tablename_after_insert()`
](/appgini/help/advanced-topics/hooks/table-specific-hooks/#tablename_after_insert).

<video width="100%" controls>
    <source src="https://cdn.bigprof.com/screencasts/show-message-after-insert.mp4" type="video/mp4">
    Su navegador no soporta la etiqueta de video.
</video>

Esto también es útil para usar en los hooks `tablename_after_update()` y
`tablename_after_delete()`, donde puede mostrar un mensaje
al usuario después de actualizar o eliminar un registro.

### Incluir el ID de la ventana al redirigir a otra página

Su aplicación AppGini ya incluye el ID de la ventana al redirigir
a otra página, por lo que no necesita hacer nada especial. Pero en caso de
que esté usando su propio código para redirigir a otra página, necesita
incluir el ID de la ventana en la URL. Puede hacerlo usando el
método `WindowMessages::windowIdQuery()`, así:

```php
$url = 'http://example.com/another-page.php?' . WindowMessages::windowIdQuery();
redirect($url);
```

### Incluir el ID de la ventana en un formulario en páginas personalizadas

Las páginas integradas de AppGini ya incluyen el ID de la ventana en los formularios, por lo que
no necesita hacer nada especial. Pero en caso de que esté usando su propio
código para crear un formulario en una página personalizada, necesita incluir el ID de la ventana
como un campo oculto en el formulario. Puede hacerlo usando este código donde
desea el campo oculto en el formulario:

```php
echo WindowMessages::includeWindowId();
```

### ¿Cómo mostrar los mensajes?

Su aplicación AppGini ya incluye el código para mostrar los
mensajes, por lo que no necesita hacer nada especial. En caso de [páginas
personalizadas](/appgini/help/advanced-topics/custom-limited-access-pages/)
sin embargo, necesita incluir el siguiente código en su página donde desea
que se muestren los mensajes:

```php
WindowMessages::getHtml();
```
