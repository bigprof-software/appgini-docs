---
title: Backing up and restoring your AppGini database
linkTitle: Database backup and restore
slug: help/application-features/database-backup-restore
description: How to back up and restore your AppGini database. This feature is built into AppGini applications and allows you to create backups of your database and restore them when needed.
keywords: backup, restore, database, AppGini, application features, mysql, mysqldump, mysql client
---

# Backing up and restoring your AppGini database

It's crucial for any application in production to have a reliable backup and restore mechanism. AppGini applications come with a built-in feature to back up and restore your database.

## Backing up your AppGini database

To back up your AppGini database, follow these steps:

1. Log in to your AppGini application as an administrator.
2. Click on the **Admin area** link in the top menu.
3. In the Admin area, open the **Utilities** menu and select **Database backups**.
4. On the Database backups page, click the **Create Backup File** button.

      ![Create Backup File button](https://cdn.bigprof.com/images/create-backup-file-button.png)

5. A confirmation dialog will appear, informing you that the application will be set to *maintenance mode* during the backup process. Click **OK** to proceed.
      > Usually the backup process takes only a few seconds, but it may take longer for larger databases. During this time, the application will be in maintenance mode, and users will not be able to access it.

      ![Backup confirmation dialog](https://cdn.bigprof.com/images/backup-confirmation-dialog.png)

6. Once the backup is complete, it will be listed under the **Available backups** section, showing the date, time and size of the backup file.

## Restoring your AppGini database

To restore your AppGini database from a backup file, follow these steps:

1. Log in to your AppGini application as an administrator.
2. Click on the **Admin area** link in the top menu.
3. In the Admin area, open the **Utilities** menu and select **Database backups**.
4. On the Database backups page, find the backup file you want to restore from the **Available backups** section.
5. Click the **Restore** button next to the backup file you want to restore.

      ![Restore backup button](https://cdn.bigprof.com/images/restore-backup-button.png)

6. A confirmation dialog will appear, informing you that the application will be set to *maintenance mode* during the restore process, and that all data in the current database will be **replaced** with the data from the backup file. This includes user accounts, settings, and all data in the database. Click **OK** to proceed.
      > Restoring a backup takes a few seconds, but it may take longer for larger databases. During this time, the application will be in maintenance mode, and users will not be able to access it.

      ![Restore confirmation dialog](https://cdn.bigprof.com/images/restore-confirmation-dialog.png)

7. Once the restore is complete, the application will exit maintenance mode, and you will see a success message indicating that the database has been restored successfully.

## Requirements

To use the backup feature, your server must have the `mysqldump` utility installed. This utility is typically included with MySQL installations, so if you have MySQL installed, you likely have `mysqldump` available.

And to be able to restore a backup, your server must have the `mysql` command-line client installed. This is also typically included with MySQL installations.

### Installing MySQL command-line utilities

In some environments, MySQL may be installed on a separate server, and your application server may not have direct access to the MySQL command-line utilities mentioned above. To enable the built-in backup and restore feature to work in such cases, you can install the MySQL command-line utilities on your application server. Assuming you have root access to your server, you can install these utilities using the following commands:

- **For Debian/Ubuntu-based systems:**
  ```bash
  sudo apt-get install mysql-client
  ```
- **For Red Hat/CentOS-based systems:**
  ```bash
  sudo yum install mysql
  ```
- **For Windows systems:**
  Download the MySQL Installer from the [MySQL website](https://dev.mysql.com/downloads/installer/) and select the "MySQL Server" and "MySQL Client" components during installation.
- **For macOS systems:**
  If you have Homebrew installed, you can use the following command:
  ```bash
  brew install mysql
  ```

