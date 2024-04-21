---
title: Enabling LDAP Extension in PHP
linkTitle: Enable LDAP
slug: help/enable-php-ldap-extension
---

Before [configuring LDAP settings in your AppGini app](/appgini/help/ldap-authentication), you need to ensure that the LDAP extension in PHP is enabled. This process varies depending on your operating system.

### For Linux (Debian/Ubuntu)

On Debian-based systems like Ubuntu, you can enable the LDAP extension for PHP by installing the required packages. Open a terminal and run the following commands:

```bash
sudo apt update
sudo apt install php-ldap
```

After installation, restart the Apache server to apply the changes:

```bash
sudo systemctl restart apache2
```

### For Linux (CentOS/RHEL)

For CentOS or Red Hat-based distributions, use the following commands in the terminal:

```bash
sudo yum update
sudo yum install php-ldap
```

Then, restart the Apache server:

```bash
sudo systemctl restart httpd
```

### For Windows

Enabling the LDAP extension in Windows is done through the `php.ini` file. Follow these steps:

1.  Locate your `php.ini` file, which is usually found in your PHP installation directory, e.g., `C:\php\php.ini`.
2.  Open `php.ini` in a text editor with administrative privileges.
3.  Search for the line `;extension=ldap`. If the line starts with a semicolon (;), it's commented out.
4.  Remove the semicolon to enable the extension. It should look like this:
    
    ```
    extension=ldap
    ```
    
5.  Save the `php.ini` file and restart your web server for the changes to take effect.

For WAMP, XAMPP, or other integrated server packages, you might be able to enable the LDAP extension through their respective control panels, usually by ticking a checkbox or switching a toggle next to the PHP LDAP extension.

### Verifying LDAP Extension Activation

To confirm that the LDAP extension is active, create a PHP file with the following content and navigate to it in your web browser:

```php
<?php phpinfo();
```

This outputs information about your PHP configuration. Look for a section titled 'ldap'. If it's present, the LDAP extension is enabled and working.

After enabling the LDAP extension in PHP, a new 'LDAP Settings' tab will become available within the admin settings page of your AppGini application. You can now proceed to configure the LDAP settings as described in the sections above.

Remember to keep your PHP environment secure and up to date, as enabling extensions can expose new vectors for potential vulnerabilities if not managed properly.

