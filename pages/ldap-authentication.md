---
title: Autenticación LDAP
linkTitle: Autenticación LDAP
slug: help/ldap-authentication
---

# Autenticación LDAP

Las aplicaciones AppGini ahora admiten la integración [LDAP](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol) a partir de la versión 24.10, lo que proporciona un proceso de inicio de sesión más optimizado para los usuarios que ya forman parte de un directorio LDAP. A continuación, se explica cómo configurar la integración LDAP dentro de su aplicación AppGini.

> Tenga en cuenta que la autenticación LDAP solo está disponible en [AppGini Pro](/appgini/order).

## Vídeo de descripción general de la configuración LDAP en aplicaciones AppGini

<video style="width: 100%; height: auto;" controls>
<source src="https://cdn.bigprof.com/screencasts/ldap-login-in-appgini-applications.mp4" type="video/mp4">
Su navegador no admite la etiqueta de vídeo.
</video>

## Habilitación de la extensión LDAP en PHP

Antes de comenzar, [asegúrese de que la extensión LDAP en PHP esté habilitada](/appgini/help/enable-php-ldap-extension/), ya que la integración está deshabilitada de forma predeterminada. Al habilitar esta extensión, una nueva pestaña 'Configuración LDAP' estará disponible dentro de la página de configuración de administración de su aplicación AppGini.

Una forma de verificar si la extensión LDAP está habilitada es iniciar sesión en su aplicación AppGini como administrador, ir al área de administración > Menú Utilidades > Estado del servidor. En la página de estado del servidor, en la sección PHP, debería ver los detalles de LDAP como en la captura de pantalla a continuación si LDAP está habilitado:

![Sección de información LDAP en PHP info](https://cdn.bigprof.com/images/ldap-section-php-ini.png)

## Configuración de los ajustes LDAP

Inicie sesión en su aplicación AppGini como administrador. Vaya al área de administración, abra el menú Utilidades y haga clic en Configuración de administración. Si la extensión LDAP está habilitada en PHP, debería ver una pestaña 'Configuración LDAP'. Una vez que acceda a la pestaña 'Configuración LDAP', podrá configurar la integración LDAP. Esta sección le permite cambiar del método de inicio de sesión predeterminado, donde AppGini administra los nombres de usuario y las contraseñas, a un sistema de autenticación basado en LDAP.

![Configuración LDAP de AppGini](https://cdn.bigprof.com/images/ldap-settings.png)

### Especificación del servidor LDAP

Ingrese la URL de su servidor LDAP en el formato `ldap.example.com` o `ldaps://ldap.example.com` para conexiones SSL. Si su servidor LDAP opera en un puerto no estándar, puede especificarlo como `ldap.example.com:389`.

### Versión de LDAP

Seleccione la versión del protocolo LDAP que corresponda a la configuración de su servidor. La mayoría de los servidores funcionarán con la versión 3, que se recomienda para una compatibilidad óptima.

### Patrón de DN (Nombre Distinguido) de usuario

Debe especificar el patrón para envolver el nombre de usuario para los inicios de sesión LDAP. Este patrón generalmente incluye prefijos y sufijos, como:

```
uid=USERNAME,ou=people,dc=ldap,dc=example,dc=com
```

En este ejemplo, el prefijo del nombre de usuario es `uid=`, y el sufijo del nombre de usuario es `,ou=people,dc=ldap,dc=example,dc=com` (tenga en cuenta la coma inicial `,`). Ajuste los componentes del dominio (`dc=`) de acuerdo con el dominio de su servidor LDAP.

### Manejo de usuarios inexistentes

Determine cómo debe AppGini manejar los intentos de inicio de sesión de usuarios que están autenticados a través de LDAP pero que no existen en la base de datos de AppGini. Puede elegir:

*   Deshabilitar el inicio de sesión para dichos usuarios, lo que requiere que un administrador los agregue manualmente, o
*   Crear automáticamente una cuenta de usuario en AppGini y asignar al usuario a un grupo predeterminado que puede especificar.

Tenga en cuenta que la lista de grupos no incluye el grupo de administradores para evitar una escalada de privilegios no deseada de los usuarios normales. Si necesita asignar derechos de administrador a un usuario LDAP, debe hacerlo manualmente desde el área de administración.

## Consideraciones importantes

Antes de habilitar la autenticación LDAP, confirme que su nombre de usuario de administrador de AppGini existe en el directorio LDAP. De lo contrario, no podrá iniciar sesión en AppGini con privilegios de administrador. Si esto ocurre, deberá editar el archivo `config.php` manualmente para volver al método de inicio de sesión predeterminado. Esto se puede hacer cambiando la línea:

```
'loginMethod' => "ldap",
```

a:

```
'loginMethod' => "default",
```

## Prueba de la integración LDAP

Después de guardar los cambios, es aconsejable probar la integración, sin cerrar sesión en su cuenta de administrador. Para hacerlo, abra una ventana de navegador anónima (es decir, de incógnito o privada), visite su aplicación AppGini e intente iniciar sesión con un usuario LDAP. Si la configuración es correcta, los usuarios deberían poder iniciar sesión con sus credenciales LDAP y ser agregados automáticamente al grupo predeterminado especificado si aún no existen en AppGini.

Si no puede iniciar sesión como usuario LDAP, esto podría deberse a una configuración LDAP incorrecta. En ese caso, cambie a la ventana del navegador donde ha iniciado sesión como administrador, intente ajustar la configuración, luego vuelva a la ventana anónima e intente iniciar sesión.

## Solución de problemas

Si no puede iniciar sesión después de habilitar LDAP y se le bloquea el acceso a su cuenta de administrador, puede deshabilitar LDAP manualmente. Para hacerlo, deberá editar el archivo `config.php` para volver al método de inicio de sesión predeterminado. Esto se puede hacer cambiando la línea:

```
'loginMethod' => "ldap",
```

a:

```
'loginMethod' => "default",
```

## Conclusión

Siguiendo estos pasos, puede integrar eficazmente la autenticación LDAP en su aplicación AppGini, aprovechando las cuentas de usuario existentes y optimizando el proceso de inicio de sesión. Asegúrese de probar exhaustivamente la configuración con diferentes escenarios de usuario para garantizar una transición sin problemas.
