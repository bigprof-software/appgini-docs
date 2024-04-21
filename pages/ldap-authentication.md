---
title: LDAP Authentication
linkTitle: LDAP Authentication
slug: help/ldap-authentication
---

AppGini applications now support [LDAP](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol) integration starting from version 24.10, providing a more streamlined login process for users who are already part of an LDAP directory. Here's how you can set up LDAP integration within your AppGini application.

> Kindly note that LDAP authentication is available only in [AppGini Pro](/appgini/order).

## Video overview of LDAP settings in AppGini apps

<video width="100%" height="auto" controls="" allowfullscreen="">
<source src="https://cdn.bigprof.com/screencasts/ldap-login-in-appgini-applications.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

## Enabling LDAP Extension in PHP

Before you begin, [ensure that the LDAP extension in PHP is enabled](/appgini/help/enable-php-ldap-extension), as the integration is disabled by default. Upon enabling this extension, a new 'LDAP settings' tab will become available within the admin settings page of your AppGini application.

One way to check if LDAP extension is enabled is to sign in to your AppGini app as admin, go to the admin area > Utilties menu > Server status. In the server status page, under the PHP section, you should see LDAP details like the screenshot below if LDAP is enabled:

![LDAP info section under PHP info](https://cdn.bigprof.com/images/ldap-section-php-ini.png)

## Configuring LDAP Settings

Sign in to your AppGini app as administrator. Go to the admin area, open the Utilities menu, and click on Admin settings. If the LDAP extension is enabled in PHP, you should see an 'LDAP settings' tab. Once you access the 'LDAP settings' tab, you can configure the LDAP integration. This section allows you to switch from the default login method, where AppGini manages usernames and passwords, to an LDAP-based authentication system.

![AppGini LDAP settings](https://cdn.bigprof.com/images/ldap-settings.png)

### Specifying the LDAP Server

Input your LDAP server URL in the format `ldap.example.com` or `ldaps://ldap.example.com` for SSL connections. If your LDAP server operates on a non-standard port, you can specify it like `ldap.example.com:389`.

### LDAP Version

Select the LDAP protocol version that corresponds to your server's configuration. Most servers will work with version 3, which is recommended for optimal compatibility.

### User DN (Distinguished Name) Pattern

You must specify the pattern for wrapping the username for LDAP logins. This pattern usually includes prefixes and suffixes, such as:

```
uid=USERNAME,ou=people,dc=ldap,dc=example,dc=com
```

In this example, the username prefix is `uid=`, and the username suffix is `,ou=people,dc=ldap,dc=example,dc=com` (note the initial comma `,`). Adjust the domain components (`dc=`) according to your LDAP server's domain.

### Handling Non-Existent Users

Determine how AppGini should handle login attempts from users who are authenticated through LDAP but do not exist in the AppGini database. You can choose to:

*   Disable login for such users, requiring an admin to manually add them, or
*   Automatically create a user account in AppGini and assign the user to a default group that you can specify.

Note that the list of groups doesn't include the Admins group to prevent unintended privilege escalation of normal users. If you need to assign admin rights to an LDAP user, you must do so manually from the admin area.

## Important Considerations

Before enabling LDAP authentication, confirm that your AppGini admin username exists in the LDAP directory. Otherwise, you'll be unable to log in to AppGini with admin privileges. If this does occur, you will need to edit the `config.php` file manually to revert to the default login method. This can be done by changing the line:

```
'loginMethod' => "ldap",
```

to:

```
'loginMethod' => "default",
```

## Testing LDAP Integration

After saving the changes, it's wise to test the integration, without signing out from your admin account. To do so, open an anonymous (i.e. incognito or private) browser window, visit your AppGini application, and attempt to log in with an LDAP user. If the setup is correct, users should be able to sign in with their LDAP credentials and be automatically added to the specified default group if they don't already exist in AppGini.

If you're unable to sign in as an LDAP user, this could be due to incorrect LDAP settings. In that case, switch to the browser window where you are signed in as admin, try to adjust the settings, then switch back to the anonymous window and try to sign in.

## Troubleshooting

If you're unable to sign in after enabling LDAP, and you get locked out of your admin account, you can manually disable LDAP. To do so, you will need to edit the `config.php` file to revert to the default login method. This can be done by changing the line:


```
'loginMethod' => "ldap",
```

to:

```
'loginMethod' => "default",
```

## Conclusion

By following these steps, you can effectively integrate LDAP authentication into your AppGini application, leveraging existing user accounts and streamlining the login process. Make sure to thoroughly test the configuration with different user scenarios to ensure a smooth transition.

