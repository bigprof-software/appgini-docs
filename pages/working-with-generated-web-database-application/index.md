---
title: Working with the generated web database application
linkTitle: Working with generated web app
slug: help/working-with-generated-web-database-application
description: Learn how to work with the generated web database application.
keywords: working with generated web app, generated web app, generated web database application
---

# Working with the generated web database application



After generating the PHP application based on your project, the next
step is to upload the files to your server and set up the database. The
generated files are saved to a folder you specify. Below is a screenshot
of a folder containing files generated from a project.


![A folder containing files generated from an AppGini project](https://cdn.bigprof.com/appgini-desktop/help/working-with-generated-web-app.png "A folder containing files generated from an AppGini project")


To upload the generated files, you should use an FTP client. A very good
(and open source) program is
[FileZilla](https://filezilla-project.org/download.php) .

You should upload the entire folder to your web server. Make sure that
your web server is properly configured to run .php files as PHP scripts
(otherwise, they will probably be treated as text files and their entire
source code will be displayed in the visitors' browsers.)

After you upload the files, you are ready to set up the database. Let's
move on!

> **IMPORTANT Security note!**
Your database contains important information that you do not want any
unauthorized person to mangle with \... So, only authorized users should
have access to your database.

The genrated AppGini app implements an advanced, yet
intuitive, user management system. This system allows users to log into
the generated application and have limited permissions that you (the
admin) have full control of.

The admin has access to an [admin
area](/appgini/help/working-with-generated-web-database-application/the-admin-interface/)
where he can define groups. Each group has its own permissions over each
table in your application.

For example, let's say that you have created an application for storing
clients' contacts, vendors' contacts, and employees' contacts. The
admin can define a group called 'HR' which can view and edit only the
employees' contacts, a group called 'Sales' which can view and edit
only the clients' contacts, and a group called 'Procurement' which
can view and edit only the vendors' contacts. Each group can have one
or more members, and each member inherits his group's permissions. The
following diagram explains this graphically.


![User groups and permissions in AppGini](https://cdn.bigprof.com/images/group.gif "User groups and permissions in AppGini")



If a user of the Sales group tries to access the Vendors table, he will
not be permitted. If an anonymous user tries to access any table, he
will not be permitted. If the admin changes the access permissions of a
group, all members of that group will instantly be granted the new
permissions (and denied the old ones.)

You can set the permissions of anonymous users in AppGini before file
generation. And you can change them later from the [admin
area](/appgini/help/working-with-generated-web-database-application/the-admin-interface/)
. Please be very careful with setting the anonymous permissions to avoid
compromising your data.

## A briefing of the generated files

For each table in your project, AppGini will generate several files. For
example, in the above file list, the \"categories\" table has these
files:

-   `templates/categories_templateDV.html` This file contains the
    template that controls the layout of the detail view form of the
    table. This form is where users can enter new records or edit
    existing ones.
    
-   `templates/categories_templateDVP.html` This file contains the
    template that controls the layout of the printer-friendly detail
    view form of the table.
    
-   `templates/categories_templateTV.html` This file contains the
    template for displaying each record in the table view. The table
    view is a list of the records in the table.
    
-   `templates/categories_templateTVS.html` This is the same as the
    `categories_templateTV.html`, except that it controls the template
    for the selected record only. When users click on a record in the
    table view to select it, the selected record is highlighted in the
    table view, and its contents are displayed in the detail view for
    editing or deleting.
    
-   `templates/children-categories.php` If categories table is
    displayed as a child of another table, this is the file used to
    format the child view.
    
-   `categories_dml.php` This file contains the code that controls
    what happens on inserting a new record into the table, editing an
    existing record, or deleting a record.
    
    This file also contains the `form()` function which controls the
    display of the detail view, using the `categories_templateDV.html`
    template file.
    
-   `categories_autofill.php` If you have [auto-fill lookup
    fields](/appgini/help/working-with-projects/understanding-lookup-fields/)
    in your table, this file contains the code to populate these
    autofill fields. This file is called through an ajax request and
    sends javascript code to the browser.
    
-   `categories_view.php` This is the controller page that welds all
    the above files together into a single page. You can control several
    display options and permissions in this page.



