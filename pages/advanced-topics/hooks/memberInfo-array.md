---
title: Matriz memberInfo
linkTitle: Matriz memberInfo
slug: help/advanced-topics/hooks/memberInfo-array
description: Aprenda sobre la matriz memberInfo que se pasa a muchas funciones hook en AppGini y que contiene la información del miembro actualmente conectado.
keywords: memberInfo, matriz, miembro conectado, nombre de usuario, groupID, grupo, admin, correo electrónico, IP, campos personalizados, getMemberInfo
---

# Matriz memberInfo

`$memberInfo` es una matriz asociativa que contiene la información del miembro conectado. La matriz contiene las siguientes claves:

*   `username`: el nombre de usuario del miembro.
*   `groupID`: el ID numérico del grupo del miembro.
*   `group`: el nombre del grupo del miembro.
*   `admin`: verdadero para el miembro administrador, falso para los demás.
*   `email`: la dirección de correo electrónico del miembro.
*   `IP`: la dirección IP desde la que el miembro está actualmente conectado.
*   `custom`: una matriz numérica que contiene los valores de los campos personalizados para el miembro. Los campos personalizados se pueden definir a través de la página de configuración de administración en el área de administración de su aplicación AppGini. Actualmente se admiten hasta 4 campos personalizados. Por lo tanto, para acceder al valor del primer campo personalizado para el miembro, puede usar `$memberInfo['custom'][0]`.

La matriz `$memberInfo` se pasa a muchas funciones hook, tanto [globales](/appgini/help/advanced-topics/hooks/global-hooks/) como [específicas de tabla](/appgini/help/advanced-topics/hooks/table-specific-hooks/). Por ejemplo, puede acceder al nombre de usuario del miembro actualmente conectado en una función hook usando `$memberInfo['username']`.

> **Consejo:** Puede recuperar esta matriz en su propio código llamando a la función `getMemberInfo()`, que devuelve esta matriz.
