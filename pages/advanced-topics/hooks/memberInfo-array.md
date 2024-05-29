---
title: memberInfo array
linkTitle: memberInfo array
slug: help/advanced-topics/hooks/memberInfo-array
description: Learn about the memberInfo array that is passed to many hook functions in AppGini, and contains the info of the currently logged member.
keywords: memberInfo, array, logged member, username, groupID, group, admin, email, IP, custom fields, getMemberInfo
---

# memberInfo array

`$memberInfo` is an associative array containing logged member's info. The array contains the following keys:

*   `username`: the member username.
*   `groupID`: the numeric ID of the member's group.
*   `group`: the name of the member's group.
*   `admin`: true for admin member, false for others.
*   `email`: the email address of the member.
*   `IP`: the IP address from where the member is currently logged.
*   `custom`: a numeric array containing the values of custom fields for the member. Custom fields can be defined via the admin settings page in the admin area of your AppGini application. Currently up to 4 custom fields are supported. So, to access the value of the first custom field for the member, you can use `$memberInfo['custom'][0]`.

The `$memberInfo` array is passed to many hook functions, both [global](/appgini/help/advanced-topics/hooks/global-hooks/) and [table-specific](/appgini/help/advanced-topics/hooks/table-specific-hooks/). For example, you can access the username of the currently logged member in a hook function by using `$memberInfo['username']`.

> **Tip:** You can retrieve this array in your own code by calling the function `getMemberInfo()`, which returns this array.

