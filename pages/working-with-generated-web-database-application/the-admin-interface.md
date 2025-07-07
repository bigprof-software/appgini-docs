---
title: La interfaz de administración
linkTitle: La interfaz de administración
slug: help/working-with-generated-web-database-application/the-admin-interface
---

# La interfaz de administración

AppGini le permite crear cuentas de miembros y controlar los privilegios
de los miembros. Para cada tabla de su aplicación, puede controlar si
los miembros pueden agregar nuevos registros, editar los existentes y/o eliminar registros.
Además, puede controlar qué registros puede editar y/o eliminar un miembro:
solo sus propios registros (registros agregados por el propio miembro), o los registros de su
grupo (registros agregados por cualquier miembro del grupo al que
pertenece nuestro miembro), o todos los registros ingresados por él y cualquier otro miembro de
cualquier grupo.

## Grupos de miembros

Para facilitar la administración de los miembros, AppGini le permite crear
grupos y asignar cada miembro a un grupo. Por lo tanto, en lugar de asignar
privilegios a cada miembro individual por separado, asigna privilegios
a un grupo. A todos los miembros del grupo se les asignan automáticamente
estos privilegios.

### Escenario de ejemplo: una aplicación de publicación de contenido

Por ejemplo, si está desarrollando una aplicación de publicación de contenido, podría
crear un grupo de autores que tenga el privilegio de agregar nuevos registros
a la tabla de artículos. Cada miembro del grupo de autores puede editar sus propios
registros (artículos), pero no los artículos de otros miembros (autores).

También crearía un grupo de editores. Los miembros de este grupo pueden editar
cualquier registro en la tabla de artículos, pero no pueden eliminar ni agregar
registros.

Finalmente, podría crear un grupo de suscriptores. Los miembros de este grupo solo pueden
leer artículos (es decir, ver registros de la tabla de artículos), pero
no editar, eliminar ni agregar registros.

## Acceso a la página de inicio de administración

La interfaz de administración le permite definir grupos y sus privilegios,
aprobar y prohibir miembros, enviar notificaciones por correo electrónico a grupos o
miembros individuales, además de otras tareas administrativas.

Puede acceder a la interfaz de administración iniciando sesión como usuario administrador y luego haciendo clic en el enlace 'Área de administración' en la parte superior de la página. Esto lo llevará a la página de inicio de administración, similar a la siguiente.

!["La página de inicio de administración de una aplicación AppGini"](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-2.png "La página de inicio de administración de una aplicación AppGini")

Después de iniciar sesión, verá la página de inicio de administración, que proporciona una revisión rápida
de los últimos eventos: miembros más nuevos, miembros más activos, registros y actualizaciones más recientes,
además de enlaces a todas las herramientas de administración.

## Algunas características de la interfaz de administración

-   Gestión de grupos de usuarios y usuarios.
-   El enlace 'Configuración de administrador' en la página de inicio de administración le permite
    ajustar varias configuraciones administrativas. Estas incluyen:
    -   Cambiar el nombre de usuario y la contraseña del administrador.
    -   Cambiar el nombre y el correo electrónico utilizados para los detalles del remitente al
        enviar notificaciones por correo electrónico a grupos o miembros.
    -   Definir/personalizar hasta 4 campos de información que se les pide a los nuevos miembros
        que completen durante el registro.
    -   Personalizar el contenido del correo electrónico enviado a los nuevos miembros cuando
        son aprobados.
    -   Personalizar el formato de fecha utilizado para mostrar las fechas en la interfaz de administración.
    -   Personalizar el número de filas que se mostrarán por página en las páginas 'Ver
        grupos', 'Ver miembros' y 'Ver registros de miembros'.
    -   Definir el modo de registro predeterminado para nuevos grupos.
    -   Cambiar el nombre del grupo anónimo y del miembro anónimo.
