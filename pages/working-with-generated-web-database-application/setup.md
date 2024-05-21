---
title: Setup
linkTitle: Setup
slug: help/working-with-generated-web-database-application/setup
---

# Setup of AppGini-generated applications

## Accessing your application

After [uploading your PHP application files](../application-uploader.md) to your server,
you can access it by pointing your browser to the application's URL. Depending on your server,
the URL might look like this if you uploaded the files to the document root:

```plaintext
https://www.yourserver.com/
```

Or like this if you uploaded the files to a subfolder named `myapp`:

```plaintext
https://www.yourserver.com/myapp/
```

Replace `www.yourserver.com` with your server name 
(or IP address if you are running the server on an intranet),
and `myapp` with the path to the folder where you uploaded the files.

## Step 1: Solve the captcha

The first time you access your application, you'll be presented with a captcha to solve.
This is a security measure to prevent bots from trying to access your setup page.

![Setup captcha](https://cdn.bigprof.com/images/appgini-setup-01-captcha.png "Setup captcha")

Simply solve the captcha and click the `Submit` button. Please note that this step
might not be displayed if your server doesn't have the `GD` library installed. In this case,
just skip to the next step.

If you're unable to solve the captcha for any reason, you can disable it by editing the
generated `definitions.php` file and changing the following line:

```php
@define('FORCE_SETUP_CAPTCHA', true);
```

to:

```php
@define('FORCE_SETUP_CAPTCHA', false);
```

## Step 2: The setup form

In the next step, you should see the following intro screen:

![Setup intro](https://cdn.bigprof.com/images/appgini-setup-02-setup-intro.png "Setup intro")

Click 'Continue' to proceed to the setup checklist:

![Setup checklist](https://cdn.bigprof.com/images/appgini-setup-03-prepare-db-info.png "Setup checklist")

This simply lists the required database information you need to have at hand before proceeding.
Usually, you can retrieve this information from your hosting control panel.
In some cases, you might need to create a new database and user for your application,
which you can also do from your hosting control panel, using a tool like phpMyAdmin,
or through the command line.

For more details, please refer to [how to create a new MySQL/MariaDB database and user](../create-mysql-database-and-user.md).

Once you have the required information, click 'Continue' to proceed to the database setup form:

![Database setup form](https://cdn.bigprof.com/images/appgini-setup-04-setup-form.png "Database setup form")

Fill in the required information:

- **MySQL server (host)**: This is usually `localhost`, but it might be different depending on your hosting provider.
- **Database name**, **MySQL Username**, and **MySQL Password**: These are the database name, username, and password you created earlier.
- **MySQL port**: This is usually `3306`, but it might be different depending on your hosting provider.

After typing in the above information, a connection test will be performed to ensure that the application can connect to the database.
If the connection test fails, you'd see an error message as below:

![Database connection error](https://cdn.bigprof.com/images/appgini-setup-05-db-connection-error.png "Database connection error")

In that case, double-check the information you entered and make sure it's correct. Then click the 'Retry' button to the right of the error message
to re-test the connection.

If the connection test succeeds, you'll see a success message as below:

![Database connection success](https://cdn.bigprof.com/images/appgini-setup-06-db-connection-success.png "Database connection success")

Next, provide the desired admin username, email, and password for your application.
This will be the username and password you'll use to log in to your application's [admin area](the-admin-interface.md), where
you can manage your application's settings, users, groups, and more.

After filling in the admin information, click 'Submit' to proceed to the final step.

## Step 3: Finalizing the setup

Your AppGini-generated application will next attempt to create the necessary database tables and populate them with initial data.
If the setup process completes successfully, you'll see a success message as below:

![Setup success](https://cdn.bigprof.com/images/appgini-setup-07-success.png "Setup success")

Depending on what you want to do next, click one of the options provided.

That's it! You've successfully set up your AppGini-generated application.

