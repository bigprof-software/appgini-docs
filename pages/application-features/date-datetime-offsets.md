---
title: Desplazamientos de fecha y fecha y hora
linkTitle: Desplazamientos de fecha y fecha y hora
slug: help/application-features/date-datetime-offsets
description: Uso de valores de fecha y fecha y hora fijos y relativos como valores predeterminados en los campos de fecha, fecha y hora y marca de tiempo en AppGini.
keywords: fecha, fecha y hora, marca de tiempo, valor predeterminado, fecha relativa, fecha y hora relativa, fecha fija, fecha y hora fija
---

# Desplazamientos de fecha y fecha y hora

## Establecer valores fijos de fecha y fecha y hora como predeterminados

Cuando establece un campo de fecha o fecha y hora en AppGini, puede especificar un valor predeterminado para él. Este valor predeterminado puede ser una fecha o fecha y hora fija, o puede ser una fecha o fecha y hora relativa. Las fechas y fechas y horas relativas se calculan en función de la fecha y hora actuales cuando se guarda el registro.

Especificar una fecha o fecha y hora fija es sencillo. Simplemente ingrese la fecha o fecha y hora deseadas en la propiedad de valor predeterminado del campo. Por ejemplo, puede ingresar `2020-01-01` para establecer la fecha predeterminada en el 1 de enero de 2020, o `2020-01-01 12:00:00` para establecer la fecha y hora predeterminada en el 1 de enero de 2020 a las 12:00 PM.

Sin embargo, esto generalmente no es muy útil, ya que normalmente querrá establecer la fecha o fecha y hora predeterminada en un valor relativo a la fecha y hora actuales. Por ejemplo, es posible que desee establecer la fecha de cumplimiento predeterminada de un pedido en 7 días a partir de la fecha actual, o es posible que desee establecer la fecha de vencimiento predeterminada de una suscripción en 30 días a partir de la fecha actual.

## Desplazamientos de fecha relativos

Para los campos de fecha, puede especificar un desplazamiento de fecha relativo en la propiedad **Predeterminado**. El desplazamiento puede ser un entero positivo o negativo. Los enteros positivos representan fechas futuras, siendo `1` hoy, `2` mañana, y así sucesivamente. Los enteros negativos representan fechas pasadas, siendo `-1` ayer, `-2` anteayer, y así sucesivamente.

Por ejemplo, para establecer el valor predeterminado de un campo de fecha en 7 días a partir de la fecha actual, puede ingresar `8` en la propiedad **Predeterminado**. Esto se debe a que `1` representa hoy, y `8` representa 7 días a partir de hoy.

## Desplazamientos de fecha y hora relativos

> **Nota**: Esta función está disponible a partir de AppGini 24.14

Para los campos de fecha y hora y marca de tiempo, puede especificar un desplazamiento de fecha y hora relativo en la propiedad **Predeterminado**. El desplazamiento puede ser un entero positivo o negativo, seguido de uno de los siguientes caracteres:

- `s`: segundos, por ejemplo, `+5s` para 5 segundos a partir de ahora, o `-5s` para hace 5 segundos.
- `m`: minutos, por ejemplo, `+5m` para 5 minutos a partir de ahora, o `-5m` para hace 5 minutos.
- `h`: horas, por ejemplo, `+5h` para 5 horas a partir de ahora, o `-5h` para hace 5 horas.
- `d`: días, por ejemplo, `+5d` para 5 días a partir de ahora, o `-5d` para hace 5 días.

Si desea establecer el valor predeterminado de un campo de fecha y hora en ahora, puede ingresar `+0s` en la propiedad **Predeterminado**.

### Desplazamiento a un minuto, hora o día exactos

Si desea establecer el valor predeterminado de un campo de fecha y hora en un minuto exacto (estableciendo los segundos en `00`),
hora (estableciendo los minutos y segundos en `00:00`), o día (estableciendo las horas, minutos y segundos en `00:00:00`),
simplemente agregue un `0` al desplazamiento.

Por ejemplo, para establecer el valor predeterminado de un campo de fecha y hora en la próxima
hora, puede ingresar `+1h0` en la propiedad **Predeterminado**. Si la hora actual es `12:30:15`, esto establecerá el valor predeterminado en `13:00:00`.

Del mismo modo, para establecer el valor predeterminado de un campo de fecha y hora en el día siguiente a la medianoche, puede ingresar `+1d0` en la propiedad **Predeterminado**.
Si la fecha y hora actuales son `2024-05-15 12:30:15`, esto establecerá el valor predeterminado en `2024-05-16 00:00:00`.

En la captura de pantalla de ejemplo a continuación, estamos configurando el valor predeterminado de la fecha de la transacción en `+0m0`, lo que significa la fecha y hora actuales
al minuto (con los segundos establecidos en `00`).

![Establecer fecha y hora predeterminadas en ahora](https://cdn.bigprof.com/images/set-default-datetime-to-now.png "Establecer fecha y hora predeterminadas en ahora, al minuto")
