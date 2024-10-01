---
title: Contents of the generated `hooks` folder
linkTitle: The `hooks` folder
slug: help/advanced-topics/hooks/folder-contents
description: The hooks folder is where all your custom-defined code should be placed. AppGini generates the hook files into this folder only if they don't exist. AppGini doesn't overwrite these files later. So, your customized code is retained safely no matter how many times you regenerate your project code.
keywords: hooks, folder, contents, customizing, code, global hooks, table-specific hooks, links-home, links-navmenu, footer-extras, header-extras
---

# Contents of the generated `hooks` folder

![hooks folder contents](https://cdn.bigprof.com/images/hooks-folder.png "hooks folder contents")

The hooks folder is where all your custom-defined code should be placed. AppGini generates the hook files into this folder only if they don't exist. AppGini doesn't overwrite these files later. So, your customized code is retained safely no matter how many times you regenerate your project code.

## Contents of the `hooks` folder

### `__global.php`

This file contains hook functions that get called when a new member signs up, when a member signs in successfully and when a member fails to sign in. [_Read more_](/appgini/help/advanced-topics/hooks/global-hooks/).


### `__bootstrap.php`

This file, if present, is included at the very beginning of each page of your application (including the setup page, the admin area and of course the users area). You can use it to define global functions, classes, or constants that you want to be available in all pages of your application.You could also override any of the constants defined in the generated `definitions.php` file here. For example, you can display the navigation menus in the homepage by adding this code to `__bootstrap.php`:

```php
define('HOMEPAGE_NAVMENUS', true);
```

#### Modifying session behavior via `session_options` function in `__bootstrap.php`

Another common use case for the `__bootstrap.php` file is to modify the session behavior. To do so, define a function `session_options` in this file like so:

```php
function session_options(&$options) {
    // change session behavior here
    // example: set session lifetime to 1 week
    $options['cookie_lifetime'] = 60 * 60 * 24 * 7; // 1 week
}
```

In the above example, we set the session lifetime to 1 week. Other session options you can set are listed and explained at [php.net/manual/en/session.configuration.php](https://www.php.net/manual/en/session.configuration.php). Remove the initial `session.` prefix from the option name when setting it in the `session_options` function. For example, to set the `session.gc_maxlifetime` option, you should set `$options['gc_maxlifetime'] = ...`.
    
### `{tablename}.php`

For each table in your project, a hook file named the same as the table name is created. This file contains hook functions that get called when a new record is added, when a record is edited, when a record is deleted, … etc. These hooks are table-specific. That's why each table in your project has its own hook file. [_Read more_](/appgini/help/advanced-topics/hooks/table-specific-hooks/)
      

### `links-home.php`

You can add custom links in the home page of your application by appending them to this file. The format for each link is:

```php
$homeLinks[] = [
    'url' => 'path/to/link', 
    'title' => 'Link title', 
    'description' => 'Link text',
    'groups' => ['group1', 'group2'],
    'grid_column_classes' => '',
    'panel_classes' => '',
    'link_classes' => '',
    'icon' => 'path/to/icon',
    'table_group' => ''
];
```

*Where:*

* `url` is the path to the link. This can be a relative path within your application or an external URL.
* `title` is the title of the link as it appears in the home page.
* `description` is the text that appears below the title. HTML is allowed.
* `groups` defines the groups allowed to see this link. Set to `['*']` if you want to show the link to all groups.
* `grid_column_classes` (optional) lists CSS classes to apply to the link block to control its width in different screen sizes. Example valid classes: `col-lg-4`, `col-sm-6`, ... etc. See: [getbootstrap.com/css/#grid](https://getbootstrap.com/css/#grid).
* `panel_classes` (optional) lists CSS classes to apply to the panel. Example valid classes: `panel-warning`, `panel-success`, ... etc. See: [getbootstrap.com/components/#panels](https://getbootstrap.com/components/#panels).
* `link_classes` (optional) lists CSS classes to apply to link. Example valid classes: `btn-danger`, `btn-primary`, ... etc. See: [getbootstrap.com/css/#buttons](https://getbootstrap.com/css/#buttons).
* `icon` is the path to an optional icon to use with the link.
* `table_group` is the ***name*** of the table group you wish to add the link to (if you are using table groups). The value should be set to the exact name of the group. If the table group name contains non-Latin characters, you should convert them to html entities. For example, the character ૫ should be written as `&#2795;`

### `links-navmenu.php`

You can add custom links to the navigation menu ("Jump to" menu) of your application by appending them to this file. The format for each link is:

```php
$navLinks[] = [
    'url' => 'path/to/link', 
    'title' => 'Link title', 
    'groups' => ['group1', 'group2'],
    'icon' => 'path/to/icon',
    'table_group' => 0
];
```

*Where:*

*   `groups` defines the groups allowed to see this link. Set to `['*']` if you want to show the link to all groups.
*   `icon` is the path to an optional icon to use with the link.
*   `table_group` is the ***index*** of table group, default is `0` (first table group).

### `footer-extras.php` and `header-extras.php`

Both files allow you to insert additional content to the footer and header (respectively) of all user area pages. 
You can add HTML, CSS, JavaScript and/or PHP code into those two files, provided you wrap each type of code in the appropriate tags.

That is, to add custom CSS, insert it inside `<style>` tags. To add custom JavaScript, insert it inside `<script>` tags.
To add custom PHP code, insert it inside `<?php ... ?>` tags. For HTML, just insert it as is.

> When inserting JavaScript code that makes use of jQuery, make sure to wrap your code in a jQuery `ready` function. For example:

```javascript
<script>
    $j(() => {
        // your code here
    });
</script>
```

### `{tablename}-dv.js`

This file, if present, is included in the detail view of the specified table. You can use it to add custom JavaScript code to the detail view of the specified table.

### `{tablename}-tv.js`

This file, if present, is included in the table view of the specified table. You can use it to add custom JavaScript code to the table view of the specified table.

### `index.html`

This file should not be edited. It just redirects visitors who try to access the hooks folder to the main page.  
      
    
