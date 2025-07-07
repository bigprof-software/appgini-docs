---
title: Colaboración y compatibilidad multiusuario
linkTitle: Colaboración
slug: help/application-features/collaboration-multi-users
description: Aprenda a administrar grupos de usuarios y permisos en su aplicación AppGini, y cómo configurar la propiedad de los registros.
keywords: colaboración, multiusuario, grupos de usuarios, permisos, propiedad de registros
---

# Colaboración y compatibilidad multiusuario

## **Resumen rápido**

> * **Las aplicaciones AppGini admiten múltiples usuarios.**
> * **Los usuarios se organizan en grupos, y a cada grupo se le asigna un conjunto granular de permisos.**
>   * **Los permisos facilitan la gestión del acceso a diferentes partes de la aplicación.**
> * **Los usuarios pueden registrarse para obtener una cuenta y/o ser agregados por el administrador.**
> * **Puede habilitar o deshabilitar el acceso anónimo a su aplicación.**

Las aplicaciones AppGini están diseñadas para ser utilizadas por múltiples usuarios simultáneamente. Los usuarios pertenecen a grupos,
y a cada grupo se le asigna un conjunto de permisos para acceder a diferentes partes de la aplicación.
Esta sección proporciona una descripción general de las funciones de colaboración y compatibilidad multiusuario en las aplicaciones AppGini.

Hay dos conceptos importantes que se deben comprender cuando se trata de colaboración y compatibilidad multiusuario en las aplicaciones AppGini:

1. [Grupos de usuarios](#grupos-de-usuarios)
2. [Propiedad de los registros](#propiedad-de-los-registros)

## Grupos de usuarios

Los usuarios en las aplicaciones AppGini se organizan en grupos. A cada grupo se le asigna un conjunto de permisos para acceder
a diferentes partes de la aplicación. Los permisos incluyen la capacidad de ver, agregar, editar o eliminar registros en una tabla,
así como la capacidad de importar datos desde archivos CSV.

Tomemos un ejemplo simple de una pequeña empresa que tiene un equipo de ventas, contadores y gerentes/administradores. Podemos configurar
la aplicación para que tenga tres grupos: Ventas, Contadores y Administradores. Y podemos establecer diferentes permisos para cada grupo
para manejar pedidos, clientes y transacciones, como se muestra en el siguiente diagrama:

![Ejemplo de permisos de grupos de usuarios](https://cdn.bigprof.com/images/appgini-group-permissions-diagram.png "Ejemplo de permisos de grupos de usuarios")

Organizar a los usuarios en grupos facilita la gestión de permisos sin tener que establecer permisos para cada usuario individualmente.
Un usuario que está asignado al grupo del equipo de Ventas heredará los permisos asignados al grupo de Ventas, y así sucesivamente.

### Grupos de usuarios predeterminados y la cuenta de superadministrador predeterminada

Cuando crea una nueva aplicación AppGini, viene con dos grupos de usuarios predeterminados: **Administradores** y **anónimo**. Al grupo de Administradores
se le asignan permisos completos para todas las tablas de la aplicación, mientras que al grupo anónimo no se le asignan permisos de forma predeterminada.

Durante la [configuración de la aplicación](../working-with-generated-web-database-application/setup.md), se le pide que cree una cuenta de usuario administrador.
Esta cuenta se asigna automáticamente al grupo de Administradores y se convierte en la cuenta de **superadministrador**. La cuenta de superadministrador tiene permisos completos
para todas las tablas de la aplicación y puede administrar grupos de usuarios y permisos.

## Propiedad de los registros

Además de los grupos de usuarios, las aplicaciones AppGini admiten la propiedad de los registros. Cuando un usuario agrega un registro a una tabla, se convierte en el **propietario**
de ese registro, y su grupo se convierte en el **grupo propietario** del registro. Las aplicaciones AppGini se pueden configurar para proporcionar a los
propietarios de registros (y/o miembros del grupo propietario del registro) permisos adicionales, como la capacidad de editar o eliminar sus propios registros.

Los administradores pueden ver y administrar la propiedad de los registros, así como transferir la propiedad de los registros entre usuarios y grupos.

## Configuración de grupos de usuarios y permisos

Puede configurar grupos de usuarios y permisos en su aplicación AppGini iniciando sesión como la cuenta de superadministrador,
luego navegando al **Área de administración**, abriendo el menú **Grupos** y haciendo clic en el enlace **Ver grupos**. Esto
mostrará la página **Grupos**, donde puede ver, agregar, editar y eliminar grupos de usuarios, así como enviar correos electrónicos
a los miembros del grupo, ver los miembros del grupo y ver los registros propiedad de cada grupo.

![Página de grupos](https://cdn.bigprof.com/images/appgini-groups-page-24.15.png "Página de grupos")

## Gestión de grupos

Si hace clic en el enlace del nombre del grupo, o en el icono del lápiz ✏️ a la derecha de una fila de grupo, puede editar los
detalles y permisos (privilegios) del grupo. Esto abrirá una página similar a la que se muestra a continuación.

![Edición de permisos de grupo en una aplicación AppGini](https://cdn.bigprof.com/images/appgini-edit-group-permissions-24.15.png?1 "Edición de permisos de grupo en una aplicación AppGini")

Echemos un vistazo más de cerca a las diferentes secciones de la página de edición de grupos:

### Nombre del grupo
Este es el nombre del grupo. Puede cambiarlo en cualquier momento. Utilice un nombre descriptivo que refleje el rol del grupo en su aplicación.

### Descripción
Este es un campo opcional donde puede proporcionar información adicional sobre el grupo.

### Ver miembros del grupo
Al hacer clic en este botón se mostrará una lista de todos los miembros del grupo. Puede agregar o eliminar miembros del grupo en esta página.

### Agregar un nuevo miembro al grupo
Este botón le permite agregar un nuevo miembro al grupo.

### Ver registros del grupo
Al hacer clic en este botón se mostrará una lista de todos los registros propiedad del grupo. Puede ver, editar o eliminar estos registros en esta página.
Puede filtrar registros por tabla, y también puede ordenarlos por fecha de creación, fecha de última modificación, ascendente o descendente.

### Permitir la importación de archivos CSV
Si está marcado, los miembros de este grupo podrán [importar datos desde archivos CSV](importing-exporting-data.md) a las tablas para las que tienen permisos de inserción o edición.

### Permitir que los visitantes se registren
Esta opción controla si los visitantes de la aplicación pueden registrarse para obtener una cuenta. Hay 3 valores posibles:

* **No. Solo el administrador puede agregar usuarios.** Los visitantes no pueden registrarse para obtener una cuenta. El administrador debe agregar usuarios manualmente.
* **Sí, y el administrador debe aprobarlos.** Los visitantes pueden registrarse para obtener una cuenta, pero el administrador debe aprobar su cuenta antes de que puedan iniciar sesión.
* **Sí, y aprobarlos automáticamente.** Los visitantes pueden registrarse para obtener una cuenta, y su cuenta se aprueba automáticamente.

> **Nota:** Los visitantes anónimos de su aplicación no tendrán la posibilidad de registrarse para obtener una cuenta a menos que
> al menos un grupo de usuarios esté configurado para permitir que los visitantes se registren (con o sin la aprobación del administrador).

### Permisos

Esta sección le permite establecer permisos para el grupo. Los permisos se establecen por separado para cada tabla de la aplicación.
Estos permisos incluyen la capacidad de insertar, ver, editar y eliminar registros en una tabla.

Cuando un grupo tiene permiso para insertar registros en una tabla, un usuario miembro que inserta un registro en esa tabla se convierte en el propietario de ese registro.
Y el grupo del usuario miembro se convierte en el grupo propietario del registro.

Para los permisos de ver, editar y eliminar, puede elegir una de las siguientes opciones:

* **No** - Los miembros del grupo no tendrán ese permiso en absoluto.
* **Propietario** - Los miembros del grupo tendrán ese permiso solo en los registros de los que son propietarios.
* **Grupo** - Los miembros del grupo tendrán ese permiso en todos los registros propiedad del grupo.
* **Todos** - Los miembros del grupo tendrán ese permiso en todos los registros de la tabla.

![Ejemplo de permisos del grupo Ventas](https://cdn.bigprof.com/images/appgini-group-permissions-example.png?24.15 "Ejemplo de permisos del grupo Ventas")

Por ejemplo, en la captura de pantalla anterior, los miembros del grupo "Ventas" pueden insertar registros en la tabla "Clientes"
(para definir nuevos clientes), ver todos los registros en la tabla "Clientes", editar solo los registros de los que son propietarios y eliminar solo los registros de los que son propietarios.

El menú de marca de verificación a la derecha de cada permiso le permite establecer el permiso para todas las tablas a la vez. Si
hace clic en el menú de marca de verificación junto al permiso "Ver", por ejemplo, puede establecer el permiso de visualización para todas las tablas
en "No", "Propietario", "Grupo" o "Todos" a la vez.

Del mismo modo, el menú de marca de verificación a la derecha de cada tabla le permite establecer todos los permisos para esa tabla a la vez.

### Copiar permisos de otro grupo

*Disponible desde AppGini 24.14*

![Copiar permisos de otro grupo](https://cdn.bigprof.com/images/copy-group-permissions.png "Copiar permisos de otro grupo")

Esta función le permite copiar permisos de otro grupo. Seleccione un grupo de la lista desplegable para aplicar sus permisos al grupo actual.
Puede revertir a los permisos originales haciendo clic en el icono ❌ junto a la lista desplegable de grupos.

### Guardar cambios
Después de realizar los cambios, haga clic en el botón "Guardar cambios" para guardar la configuración del grupo.

### Agregar un nuevo grupo

Para agregar un nuevo grupo, haga clic en el botón **➕ Agregar grupo** en la parte superior derecha de la página **Grupos**,
o abra el menú **Grupos** y haga clic en el enlace **➕ Agregar grupo**.
Esto abrirá una página similar a la página de edición de grupos, donde puede establecer el nombre del grupo, la descripción, los permisos y otras configuraciones.

### Eliminar un grupo

Para eliminar un grupo, haga clic en el icono **🗑️ Eliminar** a la derecha de la fila del grupo en la página **Grupos**.
Si el grupo tiene miembros, este icono estará deshabilitado. Primero debe eliminar a todos los miembros del grupo antes de poder eliminarlo.
El grupo anónimo y el grupo de Administradores no se pueden eliminar.

> **Sugerencia:** Puede deshabilitar el acceso anónimo a su aplicación eliminando todos los permisos del grupo anónimo (esta es la configuración predeterminada).

### Enviar un correo electrónico a los miembros del grupo

Para enviar un correo electrónico a todos los miembros de un grupo, haga clic en el icono **📧 Correo electrónico** a la derecha de la fila del grupo en la página **Grupos**.
Esto abrirá una página donde puede redactar un correo electrónico para los miembros del grupo.

> **¡CONSEJO!** Puede utilizar el **[plugin de Mensajes](https://bigprof.com/appgini/applications/messages-plugin)** para enviar mensajes a los miembros del grupo directamente desde la aplicación.
> El plugin de Mensajes le permite enviar mensajes a usuarios individuales, grupos o todos los usuarios de la aplicación, en un entorno seguro y libre de distracciones.
>
> ![Plugin de Mensajes](https://cdn.bigprof.com/images/messages/inbox-normal-user-dark.png "Plugin de Mensajes")

## Gestión de miembros (usuarios)

El menú **Miembros** en el área de administración le permite administrar los usuarios de su aplicación, agregar nuevos usuarios y ver los registros de los usuarios.

![El menú de miembros en el área de administración](https://cdn.bigprof.com/images/appgini-members-menu.png?24.15 "El menú de miembros en el área de administración")

Si hace clic en el enlace **Ver miembros**, verá una lista de todos los miembros de su aplicación, como se muestra en la captura de pantalla a continuación.

![](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-6.png "Gestión de miembros en una aplicación AppGini")

Si hace clic en el enlace de un nombre de usuario, o en el icono del lápiz ✏️ a la derecha de la fila de un miembro, puede editar los detalles del miembro. Esto abrirá una página similar a la que se muestra a continuación.

![Edición de un miembro en una aplicación AppGini](https://cdn.bigprof.com/images/appgini-edit-member-24.15.png "Edición de un miembro en una aplicación AppGini")

Puede cambiar el nombre de usuario, la contraseña, el correo electrónico y el grupo del miembro.

El botón **Establecer permisos especiales para este usuario** le permite establecer permisos especiales para este usuario. Esto es útil si desea otorgar
a un usuario permisos especiales que son diferentes de los permisos del grupo al que pertenece.

### Aprobar/bloquear miembros

Desmarcar la casilla de verificación **Aprobado** o marcar la casilla de verificación **Bloqueado** evitará que el usuario inicie sesión.
La diferencia entre los dos es sutil, y solo indica el estado del usuario. Un usuario no aprobado es un usuario que se ha registrado
pero que aún no ha sido aprobado por el administrador. Un usuario bloqueado es un usuario que ha sido bloqueado por el administrador. Pero el resultado es el mismo: el usuario no puede iniciar sesión.

### Campos personalizados

Las aplicaciones AppGini proporcionan un conjunto de campos personalizados que puede utilizar para almacenar información adicional sobre los usuarios.
De forma predeterminada, estos campos están etiquetados como **Nombre completo**, **Dirección**, **Ciudad** y **Estado**. Puede cambiar estas etiquetas para que coincidan con los requisitos de su aplicación.
Para ello, abra el **Área de administración** » menú **Utilidades** » **Configuración de administración**. Luego haga clic en la pestaña **Registro**. Desde allí, puede cambiar las etiquetas de los campos personalizados.

### Campo de comentarios

El campo **Comentarios** es un campo especial que le permite almacenar información adicional sobre un usuario.
Este campo no se muestra al usuario y está destinado únicamente al uso del administrador.

### Ver registros del miembro

Al hacer clic en el enlace **Ver registros del miembro** se mostrará una lista de todos los registros propiedad del miembro. Puede ver los datos sin procesar de cada registro,
o eliminar estos registros en esta página. También puede asignar registros a otro usuario o grupo.

### Enviar mensaje al miembro

Al hacer clic en el enlace **Enviar mensaje al miembro** se abrirá una página donde puede redactar un correo electrónico para el miembro.

### Eliminar miembro

Al hacer clic en el icono **🗑 Eliminar** a la derecha de la fila del miembro en la página **Miembros** se mostrará un mensaje pidiéndole que
confirme si desea eliminar a ese usuario. El usuario superadministrador y el usuario invitado no se pueden eliminar.

> **Sugerencia:** Puede deshabilitar el acceso de invitados a su aplicación eliminando todos los permisos del grupo anónimo (esta es la configuración predeterminada).

## Gestión de la propiedad de los registros

La interfaz de administración le permite ver todos los registros ingresados por cualquier miembro
o grupo. Haga clic en el enlace 'Ver registros de miembros' en la parte superior de la
página de inicio de administración. Esto mostrará una página similar a la que se muestra a continuación.

![](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-8.png "Gestión de registros en una aplicación AppGini")

Si hace clic en el icono 'Editar' a la izquierda de cualquier registro, puede ver
todos los datos de ese registro, y también puede editar la propiedad del registro.
Esto abrirá una página similar a la que se muestra a continuación.

![](https://cdn.bigprof.com/screencasts/admin-area-edit-record-ownership.png "Edición de la propiedad de los registros en una aplicación AppGini")

### Asistente de transferencia por lotes

Si desea cambiar la propiedad de varios registros a la vez, debe
utilizar el **Asistente de transferencia por lotes** en lugar de la página anterior.
Haga clic en el enlace **Transferencia por lotes de propiedad** del menú **Utilidades**
en el área de administración y siga las instrucciones del asistente.

El 'Asistente de transferencia por lotes' también le permite:

* Transferir registros de un usuario a otro.
* Transferir registros de un grupo a otro.
* Mover un usuario y todos sus registros a otro grupo.

### Propiedad automática de registros

De forma predeterminada, las aplicaciones AppGini están configuradas para asignar automáticamente la propiedad de los registros al usuario que inserta un registro.
Sin embargo, puede cambiar este comportamiento y establecer el propietario del registro como el propietario del registro principal. Esto es útil en los casos en los que
tiene una relación padre-hijo entre tablas y desea que los registros secundarios hereden el propietario del registro principal.

Para obtener más información sobre la configuración de la propiedad automática de registros, consulte la página [Propiedad automatizada de registros](../record-owners.md).

### Cambiar el propietario de un registro desde el área de usuarios

Si inicia sesión en su aplicación como el usuario superadministrador y explora cualquier registro de tabla en la aplicación,
verá un botón con 3 puntos verticales en la parte superior derecha de la página de detalles del registro, etiquetado como "Información de administrador".
Al hacer clic en este botón se mostrará un menú desplegable que enumera el propietario del registro y el grupo propietario. Puede hacer clic en el enlace "Cambiar propietario"
para cambiar el propietario del registro a otro usuario o grupo.

![Cambiar el propietario de un registro desde el área de usuarios](https://cdn.bigprof.com/images/admin-info-menu.png "Cambiar el propietario de un registro desde el área de usuarios")

También puede cambiar el propietario del registro para varios registros a la vez. Para ello, navegue a la vista de tabla de
la tabla correspondiente, seleccione los registros para los que desea cambiar el propietario, abra el menú desplegable **Más** en la parte superior de la tabla,
y haga clic en el enlace **Cambiar propietario**.

![Cambiar el propietario de un registro para varios registros a la vez](https://cdn.bigprof.com/images/change-owner-multiple-records.png "Cambiar el propietario de un registro para varios registros a la vez")
