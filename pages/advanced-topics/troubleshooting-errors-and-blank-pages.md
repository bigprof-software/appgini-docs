---

title: I see an error or a blank page in my AppGini app - how to troubleshoot?
linkTitle: Troubleshooting
slug: help/advanced-topics/troubleshooting-errors-and-blank-pages

---


**First of all:** Have you made a customization to your AppGini app,
either through
[hooks](https://bigprof.com/appgini/help/advanced-topics/hooks/) , or by
directly editing some of the generated files outside hooks? If yes:

1.  Open your AXP project file in AppGini.
2.  Generate the app to a **new empty folder** . This would create a
    clean app, without any customizations.
3.  Run your new app in your browser, trying to reproduce the error. If
    the error doesn\'t occur, then we know there is something wrong in
    the customization you\'ve made.
4.  You can either undo the customization, or if you want to debug it
    further, keep reading below for steps to discover the error and
    debug it.

**The steps below are helpful to find the exact cause of the error,
whether it\'s in your customized code, or in the generated code of your
app.**

-   Please press F12 to open the browser\'s inspector, then click on the
    \'Console\' tab. Is there any error reported there?

    ![Inspector console tab showing an example error for an AppGini
    app.](https://cdn.bigprof.com/images/appgini-inspector-console-error.png)

-   If not, and if you are able to access the admin area:

    -   Go to the *Utilities* menu \> *View/Rebuild fields* and perform
        the suggested fixes, if any.

        ![View/Rebuild fields page showing a fix
        button](https://cdn.bigprof.com/images/appgini-rebuild-fields.png)

    -   If no issues reported in *View/Rebuild fields* page, go to
        *Utilities* menu again \> *Query logs* . Are there any errors
        reported? If yes and any of the following applies:

        -   You\'ve made a customization to the generated code, or
        -   you have calculated fields in your application, or
        -   you have one or more custom SQL queries for lookup fields,

        if so, try revising your code to make sure the SQL queries are
        valid. You can use the \'Interactive SQL queries tool\' under
        the *Utilties* menu to test your query. Or you can use 3rd party
        tools like phpMyAdmin.

        ![Query logs page showing example SQL
        errors](https://cdn.bigprof.com/images/appgini-query-logs-errors.png)

-   If you found no SQL errors, open your server `error_log` file and
    check to see if any errors related to your AppGini app are reported
    in it.

    -   The location of that file varies based on your web server
        software and your OS. You should consult your web server
        documentation to learn where to find the error log file. For
        example, for Apache on linux, that file is *typically* at
        `/var/log/apache2/error.log` (but that might vary
        based on your environment configuration).

    If you find one or more errors reported in the error log file, and
    you\'ve made a customization to the generated code, try to revise
    your code and fix any syntax errors.

-   If none of the above applies to your AppGini application, please
    send us your AXP project file along with any error messages,
    screenshots and/or any other details about the error and how to
    reproduce it. You can send these via the contact form at
    <https://bigprof.com/appgini/support-request>

