---
title: Configuring file/image upload size in AppGini apps
linkTitle: File upload size
slug: help/troubleshooting/configuring-file-upload-size
description: Learn how to configure the maximum file/image upload size in AppGini apps.
keywords: file upload, image upload, file size, image size, upload limit, php.ini, upload_max_filesize, post_max_size
---

# I can't upload large files/images in my AppGini app

When you create a file or image upload field in your AppGini app,
you can configure the maximum file size that can be uploaded.
This can be done in the media tab, by clicking the **Configure** button,
and setting the maximum file size in kilobytes.

![Configuring file upload size in AppGini](https://cdn.bigprof.com/images/configure-upload-size-24.18.png)

However, you might still face issues uploading large files, even if they are within the configured limit.
This is because the server on which your AppGini app is hosted might have a lower limit set in its PHP configuration.

To fix this, you need to increase the `upload_max_filesize` and `post_max_size` settings in your server's `php.ini` file.
Here's how to do this:

1. Locate the `php.ini` file on your server. If you don't know where it is, the easiest way to check is to go to the admin area of your AppGini app, open the Utilities menu, and click on the **Server status** link. From there, search for `php.ini` in the page that opens. The path to the `php.ini` file should be displayed there.

   ![Locating php.ini file in Server status page](https://cdn.bigprof.com/images/php-ini-location-24.18.png)
   
   If you don't see the **Server status** link in the Utilities menu, it means it's been disabled in your AppGini project. You can enable that page in your AXP project under the **Security settings** section > **Allow admin access to server status page**.

   ![Enabling server status page in AppGini project](https://cdn.bigprof.com/images/enable-server-status-24.18.png)

   Alternatively, you can check your server control panel or ask your hosting provider for help in locating the `php.ini` file.

2. Open the `php.ini` file in a text editor and search for the `upload_max_filesize` setting. It might look like this:

   ```ini
   upload_max_filesize = 2M
   ```

   Change the value to the desired maximum file size. For example, to allow 10MB uploads, change it to:

   ```ini
   upload_max_filesize = 10M
   ```

3. Next, search for the `post_max_size` setting in the `php.ini` file. It might look like this:

   ```ini
   post_max_size = 8M
   ```

   Change the value to the desired maximum file size. For example, to allow 10MB uploads, change it to:

   ```ini
   post_max_size = 10M
   ```

4. Save the `php.ini` file and restart your web server. If you're not sure how to restart your web server, you can ask your hosting provider for help.
5. Try uploading the large file again in your AppGini app. It should work now.


