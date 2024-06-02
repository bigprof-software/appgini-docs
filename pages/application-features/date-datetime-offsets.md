---
title: Date and datetime offsets
linkTitle: Date and datetime offsets
slug: help/application-features/date-datetime-offsets
description: Using fixed and relative date and datetime values as default values in date, datetime, and timestamp fields in AppGini.
keywords: date, datetime, timestamp, default value, relative date, relative datetime, fixed date, fixed datetime
---

# Date and datetime offsets

## Setting fixed date and datetime values as default

When you set a date or datetime field in AppGini, you can specify a default value for it. This default value can be a fixed date or datetime, or it can be a relative date or datetime. Relative dates and datetimes are calculated based on the current date and time when the record is saved.

Specifying a fixed date or datetime is straightforward. You simply enter the desired date or datetime in the field's default value property. For example, you can enter `2020-01-01` to set the default date to January 1, 2020, or `2020-01-01 12:00:00` to set the default datetime to January 1, 2020, 12:00 PM.

However, this is usually not very useful, as you'd typically want to set the default date or datetime to a value relative to the current date and time. For example, you might want to set the default fulfillment date of an order to 7 days from the current date, or you might want to set the default expiration date of a subscription to 30 days from the current date.

## Relative date offsets

For date fields, you can specify a relative date offset in the **Default** property. The offset can be a postive or negative integer. Positive integers represent future dates, with `1` representing today, `2` representing tomorrow, and so on. Negative integers represent past dates, with `-1` representing yesterday, `-2` representing the day before yesterday, and so on.

For example, to set the default value of a date field to 7 days from the current date, you can enter `8` in the **Default** property. This is because `1` represents today, and `8` represents 7 days from today.

## Relative datetime offsets

> **Note**: This feature is available starting from AppGini 24.14

For datetime and timestamp fields, you can specify a relative datetime offset in the **Default** property. The offset can be a postive or negative integer, followed by one of the following characters:

- `s`: seconds, e.g., `+5s` for 5 seconds from now, or `-5s` for 5 seconds ago.
- `m`: minutes, e.g., `+5m` for 5 minutes from now, or `-5m` for 5 minutes ago.
- `h`: hours, e.g., `+5h` for 5 hours from now, or `-5h` for 5 hours ago.
- `d`: days, e.g., `+5d` for 5 days from now, or `-5d` for 5 days ago.

If you want to set the default value of a datetime field to now, you can enter `+0s` in the **Default** property.

### Offset to an exact minute, hour, or day

If you want to set the default value of a datetime field to an exact minute (setting seconds to `00`),
hour (setting minutes and seconds to `00:00`), or day (setting hours, minutes, and seconds to `00:00:00`),
just append a `0` to the offset. 

For example, to set the default value of a datetime field to the next
hour, you can enter `+1h0` in the **Default** property. If the current time is `12:30:15`, this will set the default value to `13:00:00`.

Similarly, to set the default value of a datetime field to the next day at midnight, you can enter `+1d0` in the **Default** property.
If the current date and time is `2024-05-15 12:30:15`, this will set the default value to `2024-05-16 00:00:00`.

In the example screenshot below, we're setting the default value of the transaction date to `+0m0`, which means the current date and time
to the minute (with seconds set to `00`).

![Setting default datetime to now](https://cdn.bigprof.com/images/set-default-datetime-to-now.png "Setting default datetime to now, to the minute")

