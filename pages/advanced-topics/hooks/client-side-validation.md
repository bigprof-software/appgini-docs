---
title: Funciones de validación JavaScript personalizadas del lado del cliente
linkTitle: Validación del lado del cliente
slug: help/advanced-topics/hooks/client-side-validation
description: Aprenda a agregar funciones de validación JavaScript personalizadas a su aplicación AppGini para validar datos en el lado del cliente antes de enviarlos.
keywords: validación del lado del cliente, validación personalizada, validación JavaScript, validación AppGini, customValidateData
---

# Funciones de validación JavaScript personalizadas del lado del cliente

> Esta función está disponible en AppGini 24.18 y versiones posteriores.

Si define una función JavaScript con el nombre especial `{tablename}_customValidateData`
(donde `{tablename}` es el nombre de una tabla en su aplicación), se llamará automáticamente durante el envío del formulario de la vista detallada.
Y si devuelve `false`, el formulario no se enviará. Puede definir funciones de validación personalizadas en cualquiera de las
siguientes ubicaciones:

* `hooks/header-extras.php`
* `hooks/footer-extras.php`
* `{tablename}-dv.js`
* Función hook [`{tablename}_dv()`](table-specific-hooks.md#tablename_dv) en `hooks/{tablename}.php`

Se pasa un argumento booleano `insertMode` a la función, que indica el propósito del envío de la siguiente manera:

* `true`: el propósito del envío es insertar un nuevo registro.
* `false`: el propósito del envío es actualizar un registro existente.

La función debe devolver un booleano (`true` o `false`), que determina si el formulario se enviará o no.

### Notas de uso

* Las funciones de validación integradas *aún* se llaman y procesan. Por lo tanto, si su función de validación personalizada devuelve `true` mientras que la
validación integrada no pasa, el formulario *no* se enviará.

* Antes de devolver `false`, debe indicar al usuario el motivo de la comprobación fallida. Recomendamos usar
la función `AppGini.modalError()` para eso.

* Esta función se ejecuta en modo *sincrónico*. Por lo tanto, si necesita emitir una solicitud ajax/fetch durante la validación, asegúrese
de ejecutarla también en modo sincrónico (por ejemplo, establezca el parámetro `async` en `false` si usa `jQuery.ajax`); de lo contrario
, no se evaluará antes del envío del formulario.

* Esta función se ejecuta en el lado del cliente para proporcionar una mejor experiencia de usuario durante el envío, pero puede ser fácilmente
eludida por el usuario. También debe implementar la validación del lado del servidor para hacer cumplir la integridad de los datos agregando
comprobaciones de validación en `hooks/{tablename}.php` en las funciones hook [`{tablename}_before_insert()`](table-specific-hooks.md#tablename_before_insert)
y [`{tablename}_before_update()`](table-specific-hooks.md#tablename_before_update).

### Ejemplo

Supongamos que tenemos una tabla llamada `customers` con un campo de número de teléfono llamado `phone`. Queremos asegurarnos de que el número de teléfono
tenga el formato `+1234567890` donde `+` es un prefijo obligatorio seguido de 10 dígitos. Para implementar esto, agregue el siguiente código
a `hooks/orders-dv.js` (créelo si no existe):

```javascript
function customers_customValidateData(insertMode) {
  var phone = $j('#phone').val();
  if(!phone.match(/^\+\d{10}$/)) {
	AppGini.modalError('El número de teléfono debe tener el formato +1234567890');
	return false;
  }

  return true;
}
```
