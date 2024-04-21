---
title: Setup
linkTitle: Setup
slug: help/working-with-generated-web-database-application/setup
---

# Setup

After uploading your PHP application files to a folder on your server,
you can access it by pointing your browser to this URL:

```plaintext
https://www.yourserver.com/path_to_appgini_generated_app
```

Replace `www.yourserver.com` with your server name or IP, and
`path_to_appgini_generated_app` with the path to your
application's folder.

## STEP 1 OF 3: Running the setup script

If you are running the generated application for the first time, you
will see the following screen when you try to access the above url:

![Setup step 1](https://cdn.bigprof.com/appgini-desktop/help/setup-1.png)

Click on the "Continue" button to proceed. You should see a list of required information to prepare for the next step:

![Setup step 2](https://cdn.bigprof.com/appgini-desktop/help/setup-2.png)

After clicking "Let's go!", you will be asked to provide the database login parameters, and create the admin account.

![](https://cdn.bigprof.com/appgini-desktop/help/setup-3.png)

Next, the script will look for tables in the database with the names you
specified in your project. It will attempt to create any table that
doesn't already exist. You will see messages indicating whether the
setup was succesful or not, and a link to your PHP application's
homepage. The home page is the file 'index.php' created in the
application folder.

If you see error messages stating that the setup script can't create
the database or any of the tables, make sure the database username and password
you provided in the previous step have enough permissions to allow you to define
the database and its tables.

## STEP 2 OF 3: Logging to the admin control panel

When you finish step 1 above and go to the home page, you'll see this
screen:


Click on the \"admin control panel\" link. You should see the following
screen:



Type the admin username and password and click \"Sign In\". The default
username is admin and the default password is admin. In the next step,
we shall change them.

## STEP 3 OF 3: Changing the admin password

After you sign in as admin, you'll see the following page:

![](https://cdn.bigprof.com/appgini-desktop/help/setup-5.png)


You should click on the \"Admin Settings\" link provided in the warning
message above. This opens the following page, where you should type a
new password and click \"Save Changes\":


![](https://cdn.bigprof.com/appgini-desktop/help/setup-admin-settings.png)


After saving the changes, you'll see this confirmation page:


![](https://cdn.bigprof.com/appgini-desktop/help/setup-admin-saved.png)


If you'd like to have a look on the generated table pages, Click \"Sign
Out\", and then click the \"Go to user's area\" link from the following
page.

For more information about using the admin area and managing users,
please refer to the [admin
interface](/appgini/help/working-with-generated-web-database-application/the-admin-interface)
section.


