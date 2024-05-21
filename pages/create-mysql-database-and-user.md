---
title: How to create a MySQL/MariaDB database and user
linkTitle: Create MySQL database and user
slug: help/create-mysql-database-and-user
keywords: create mysql database, create mysql user, create mariadb database, create mariadb user, cpanel, phpmyadmin, command line
description: Learn how to create a MySQL or MariaDB database and user using cPanel, phpMyAdmin, or the command line.
---

# How to create a MySQL/MariaDB database and user

Before you can use your AppGini-generated web database application,
you need to have a MySQL or MariaDB database and a user with
permissions to access and modify the database.

Sometimes, your hosting provider will create the database and user for you.
In this case, you'll usually receive an email with the database details. But
in most cases, you'll need to create the database and user yourself.

## Creating a database and user using cPanel

Most shared hosting providers offer cPanel, a web-based control panel that
makes it easy to manage your hosting account. Here are the general steps to
create a database and user using cPanel:

1. Log in to your cPanel account.

2. Look for a section named 'Databases' and click on 'MySQL Databases'.

3. In the 'Create New Database' section, enter a name for your database and click 'Create Database'.
   
   You should specify a name that is relevant to your application, as you might have multiple databases
   on your hosting account. So, it would be easier to identify the database later on.

   ![Create new database in cPanel](https://cdn.bigprof.com/images/cpanel-create-database.jpeg "Create new database in cPanel")

4. After creating the database, scroll down to the 'Add New User' section.

5. Enter a username and password for the new user and click 'Create User'.
   
   Make sure to use a strong password. You can use the 'Password Generator' tool to create a strong password.

   > Please take note of the database name, username, and password you've just created. You'll need them
   when setting up your AppGini-generated web database application.

6. After creating the user, scroll down to the 'Add User to Database' section.

7. Select the user you created from the 'User' dropdown and the database you created from the 'Database' dropdown.

8. Click 'Add'.

9. On the next screen, select 'All Privileges' and click 'Make Changes'.

   > Selecting 'All Privileges' will give the user full access to the database. This is
   needed for your AppGini-generated application to be able to create tables and manage data.
   But if your database schema has already been created and you don't plan to modify it,
   you can uncheck the 'Create', 'Alter', and 'Drop' privileges.

That's it! You've successfully created a database and user for your AppGini-generated web database application.
The next step is to [set up your AppGini-generated application](working-with-generated-web-database-application/setup.md)

> If your hosting provider provides another control panel, like Plesk, the steps might be slightly different
> but the general idea is the same. You can refer to your hosting provider's documentation for more details.

## Creating a database and user using phpMyAdmin

Your hosting provider might offer phpMyAdmin, a web-based tool that allows you to manage MySQL databases.
You can create a database and user using phpMyAdmin as follows:

1. Log in to your phpMyAdmin account.
2. Click on the 'Databases' tab.
3. Enter a name for your database in the 'Create database' field and click 'Create'.

   ![Create database in phpMyAdmin](https://cdn.bigprof.com/images/phpmyadmin-new-database.png "Create database in phpMyAdmin")

4. Click on the 'Privileges' tab.
5. Click 'Add user account'.
6. Enter a username and password for the new user.
7. In the 'Database for user account' section, select the database you created.
8. Click 'Go'.
9. On the next screen, select 'All Privileges' and click 'Go'.

   > Selecting 'All Privileges' will give the user full access to the database. This is
   needed for your AppGini-generated application to be able to create tables and manage data.
   But if your database schema has already been created and you don't plan to modify it,
   you can uncheck the 'Create', 'Alter', and 'Drop' privileges.

That's it! You've successfully created a database and user for your AppGini-generated web database application.
The next step is to [set up your AppGini-generated application](working-with-generated-web-database-application/setup.md)

## Creating a database and user using the command line

If you have SSH access to your server, you can create a database and user using the command line.
Here are the general steps:

1. Log in to your server using SSH.

2. Connect to MySQL using the following command:

   ```bash
   mysql
   ```

   If the above command results in an error, you might need to specify the MySQL root password:

   ```bash
   mysql -u root -p
   ```

   Then enter the MySQL root password when prompted.

3. Create a new database using the following command:

   ```sql
   CREATE DATABASE dbname;
   ```

   Replace `dbname` with the name you want to give to your database.

4. Create a new user using the following command:

   ```sql
   CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
   ```

   Replace `username` with the username you want to give to your user and `password` with the password you want to set.
   Make sure to use a strong password.

5. Grant the user full access to the database using the following command:

   ```sql
   GRANT ALL PRIVILEGES ON dbname.* TO 'username'@'localhost';
   ```

   Replace `dbname` with the name of the database you created and `username` with the username you created.

6. Flush the privileges using the following command:

   ```sql
   FLUSH PRIVILEGES;
   ```

That's it! You've successfully created a database and user for your AppGini-generated web database application.
The next step is to [set up your AppGini-generated application](working-with-generated-web-database-application/setup.md)

