---

title: The generated "hooks" folder
linkTitle: The "hooks" folder
slug: help/advanced-topics/hooks/folder-contents

---

![](https://bigprof.com/appgini/sites/default/files/hooks-folder.png)

The hooks folder is where all your custom-defined code should be placed. AppGini generates the hook files into this folder only if they don't exist. AppGini doesn't overwrite these files later. So, your customized code is retained safely no matter how many times you regenerate your project code.

## This folder contains the following files:

*   **\_\_global.php**: This file contains hook functions that get called when a new member signs up, when a member signs in successfully and when a member fails to sign in. [_More info ..._](/appgini/help/advanced-topics/hooks/global-hooks)  
      
    
*   **_tablename_.php**: For each table in your project, a hook file named the same as the table name is created. This file contains hook functions that get called when a new record is added, when a record is edited, when a record is deleted, … etc. These hooks are table-specific. That's why each table in your project has its own hook file. [_More info ..._](/appgini/help/advanced-topics/hooks/table-specific-hooks)  
      
    
*   **index.html**: This file should not be edited. It just redirects visitors who try to access the hooks folder to the main page.  
      
    
*   **links-home.php**: You can add custom links in the home page of your application by appending them to this file. The format for each link is:

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
    *   `groups` defines the groups allowed to see this link. Set to `['*']` if you want to show the link to all groups.
    *   `grid_column_classes` (optional) lists CSS classes to apply to the link block to control its width in different screen sizes. Example valid classes: `col-lg-4`, `col-sm-6`, ... etc. See: [getbootstrap.com/css/#grid](https://getbootstrap.com/css/#grid).
    *   `panel_classes` (optional) lists CSS classes to apply to the panel. Example valid classes: `panel-warning`, `panel-success`, ... etc. See: [getbootstrap.com/components/#panels](https://getbootstrap.com/components/#panels).
    *   `link_classes` (optional) lists CSS classes to apply to link. Example valid classes: `btn-danger`, `btn-primary`, ... etc. See: [getbootstrap.com/css/#buttons](https://getbootstrap.com/css/#buttons).
    *   `icon` is the path to an optional icon to use with the link.
    *   `table_group` is the ***name*** of the table group you wish to add the link to (if you are using table groups). The value should be set to the exact name of the group. If the table group name contains non-Latin characters, you should convert them to html entities. For example, the character ૫ should be written as `&#2795;`
*   **links-navmenu.php**: You can add custom links to the navigation menu ("Jump to" menu) of your application by appending them to this file. The format for each link is:

    ```php
    $navLinks[] = [
        'url' => 'path/to/link', 
        'title' => 'Link title', 
        'groups' => ['group1', 'group2'],
        'icon' => 'path/to/icon',
        'table_group' => 0
    ];
    ```
    *   `groups` defines the groups allowed to see this link. Set to `['*']` if you want to show the link to all groups.
    *   `icon` is the path to an optional icon to use with the link.
    *   `table_group` is the ***index*** of table group, default is `0` (first table group).
*   **footer-extras.php, header-extras.php**: (As of AppGini 5.40) Both files allow you to insert additional content to the footer and header (respectively) of all user area pages. You can add HTML, CSS, JavaScript and/or PHP code into those two files.