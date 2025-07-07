---
title: Habilitar la extensión LDAP en PHP
linkTitle: Habilitar LDAP
slug: help/enable-php-ldap-extension
keywords: LDAP, PHP, extensión, habilitar, Linux, Windows, Apache, CentOS, Ubuntu, Debian, Red Hat, RHEL
description: Aprenda cómo habilitar la extensión LDAP en PHP en sistemas Linux y Windows para configurar los ajustes de LDAP en su aplicación AppGini.
---

# Habilitar la extensión LDAP en PHP

Antes de [configurar los ajustes de LDAP en su aplicación AppGini](/appgini/help/ldap-authentication/), debe asegurarse de que la extensión LDAP en PHP esté habilitada. Este proceso varía según su sistema operativo.

### Para Linux (Debian/Ubuntu)

En sistemas basados en Debian como Ubuntu, puede habilitar la extensión LDAP para PHP instalando los paquetes necesarios. Abra una terminal y ejecute los siguientes comandos:

```bash
sudo apt update
sudo apt install php-ldap
```

Después de la instalación, reinicie el servidor Apache para aplicar los cambios:

```bash
sudo systemctl restart apache2
```

### Para Linux (CentOS/RHEL)

Para distribuciones basadas en CentOS o Red Hat, use los siguientes comandos en la terminal:

```bash
sudo yum update
sudo yum install php-ldap
```

Luego, reinicie el servidor Apache:

```bash
sudo systemctl restart httpd
```

### Para Windows

Habilitar la extensión LDAP en Windows se realiza a través del archivo `php.ini`. Siga estos pasos:

1.  Localice su archivo `php.ini`, que generalmente se encuentra en su directorio de instalación de PHP, por ejemplo, `C:\php\php.ini`.
2.  Abra `php.ini` en un editor de texto con privilegios administrativos.
3.  Busque la línea `;extension=ldap`. Si la línea comienza con un punto y coma (;), está comentada.
4.  Elimine el punto y coma para habilitar la extensión. Debería verse así:

    ```
    extension=ldap
    ```

5.  Guarde el archivo `php.ini` y reinicie su servidor web para que los cambios surtan efecto.

Para WAMP, XAMPP u otros paquetes de servidor integrados, es posible que pueda habilitar la extensión LDAP a través de sus respectivos paneles de control, generalmente marcando una casilla de verificación o activando un interruptor junto a la extensión PHP LDAP.

### Verificar la activación de la extensión LDAP

Para confirmar que la extensión LDAP está activa, cree un archivo PHP con el siguiente contenido y navegue hasta él en su navegador web:

```php
<?php phpinfo();
```

Esto genera información sobre su configuración de PHP. Busque una sección titulada 'ldap'. Si está presente, la extensión LDAP está habilitada y funcionando.

Después de habilitar la extensión LDAP en PHP, una nueva pestaña 'Configuración LDAP' estará disponible dentro de la página de configuración de administración de su aplicación AppGini. Ahora puede proceder a configurar los ajustes de LDAP como se describe en las secciones anteriores.

> Recuerde mantener su entorno PHP seguro y actualizado, ya que habilitar extensiones puede exponer nuevos vectores para posibles vulnerabilidades si no se administra correctamente.
