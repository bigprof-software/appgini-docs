---
title: Automatic application uploader
linkTitle: Uploading apps
slug: help/application-uploader
description: Learn how to use the automatic application uploader in AppGini to upload your apps to your server. This feature makes it much easier to deploy your apps.
keywords: automatic uploader, upload apps, deploy apps, appgini uploader, appgini deploy, appgini upload, continuous deployment, continuous integration, CI/CD, appgini CI/CD, appgini continuous deployment, appgini continuous integration, uploader security, appgini security
---

# Automatic application uploader

As of AppGini 23.10, we introduced a new feature that makes it much easier to deploy (upload) your AppGini apps to your server. By clicking a single 'Upload' button, AppGini checks the changed files in your app and uploads them to your server. You no longer need to use external FTP, SSH or other upload tools, and you don't have to worry about uploading the right files to the right folders.

### Smart features of the automatic file uploader

*   **Uploads only the files that have changed**. This means that if you make changes to your app that cause only a few files to change, the uploader will take care of detecting which files were changed and will only upload those files. This is much faster than uploading all files every time.
*   **Uploads only the files that are needed**. The uploader will only upload the files that are needed to run your app. It will ignore files that are not needed, such as log files, the local `config.php` (which should not be uploaded to the server), ...etc.
*   **Uploads files to the right folders**. The uploader will upload the files to the right folders on your server. For example, the file named `admin/index.php` in your app will be uploaded to the `admin` folder on your server. Missing folders will be created automatically as well. This saves you a lot of time trying to debug why your app is not working after uploading it.
*   **Secure upload key**. The uploader uses a secret upload key to authenticate itself to your server. This key is created the first time you use the uploader. It's a 32-character random string that is stored in AppGini config and in the `file-uploader.php` file. This all happens transparently to you, so you don't have to worry about it. Just rest assured that any one trying to access the file uploader will not be able to do so without knowing the secret key.
    
    In addition, automatic file uploading only works over HTTPS. This is to prevent anyone from intercepting the upload key and using it to upload files to your server.
    

### How to enable automatic file uploading

To enable automatic file uploading, you should:

1.  **Set the application URL** under the Security settings section of the project properties. This is the URL that your users will use to access your app. You should provide the full URL of the homepage, including the protocol (`https://`) but without `index.php` at the end. For example:
    
    https://example.com/catalog
    
    ![Set the application URL](https://cdn.bigprof.com/images/appgini-app-url.png)
    
2.  **Manually upload the generated `file-uploader.php` file to your server**. This only needs to be done once. You can do it by using any FTP or SSH tool. Once you upload it, you can use automatic uploading for all future changes. The `file-uploader.php` file is located in the home folder of your app. And it should be uploaded to the matching folder on your server. So, for the example application URL above, that file should be accessible at:
    
    https://example.com/catalog/file-uploader.php
    

### How to use automatic file uploading

After you've set the application URL and uploaded `file-uploader.php` to your server, you can use automatic file uploading by clicking the 'Upload' button in AppGini. This button can be found at the top of the project properties pane, next to the 'View files' button. It's only visible after you've generated your app.

![Upload button in the project properties pane](https://cdn.bigprof.com/images/appgini-upload-button-project-properties-pane.png)

You can also find the 'Upload' button after generating your app in the status window:

![Upload button in status window](https://cdn.bigprof.com/images/appgini-upload-button-app-generator-status-window.png)

After clicking the 'Upload' button, AppGini will perform several checks before uploading.

![Checks performed before uploading apps in AppGini](https://cdn.bigprof.com/images/appgini-app-uploader-start-checks-24.19.png)

In the screenshot above, all checks were successful. The next step after that is to check for changed files. But if any checks fail, you'll see an error message like this:

![Upload checks failed](https://cdn.bigprof.com/images/appgini-app-uploader-checks-failed-24.19.png)

You should fix the error(s) shown in the message before you can proceed with the upload. In the example above, the error is that the `file-uploader.php` file is not found on the server. You should upload it to the server as explained in the [How to enable automatic file uploading section](#how-to-enable-automatic-file-uploading) above, then retry the upload.

If all checks pass, AppGini will scan for file changes. This would take a couple of minutes or so, depending on the size of your app. Once the scan is complete, AppGini will show you a summary of the changes detected:

![Results of scanning for changed files](https://cdn.bigprof.com/images/appgini-upload-scanning-changed-files-24.19.png)

In the above screenshot, AppGini detected that 36 files were changed. You should click the button showing the number of changed files to begin the upload. In case no changes were detected, you'll see a message like this instead:

After clicking the button for uploading changes, AppGini will begin uploading only the changed files to your server. The upload progress window will show you the progress of the upload.

![Upload progress window](https://cdn.bigprof.com/images/appgini-upload-progrss-24.19.png?1)

After the upload is complete, AppGini will show you how many files were uploaded, how many were skipped (because they were unchanged/ignored) and how many failed, if any, along with a full list of files uploaded:

![Upload results window](https://cdn.bigprof.com/images/appgini-upload-finished-24.19.png)

In case of any failed uploads, they will be listed in red. You should check the error message shown for each failed upload and fix the issue. Usually, failed uploads are due to file permissions issues on the server. You can fix this by making sure that the folder to which you're uploading your app and any subfolder are writable by the web server software (apache, nginx, .. etc) you're using. For example, on most apache setups on linux, the user that owns the app folders should be `www-data`. After fixing the issue, you can retry the upload by clicking the 'Retry failed uploads' button:

![Retry failed uploads button](https://cdn.bigprof.com/images/appgini-upload-retry-failed.png)

### Troubleshooting

If you're having issues with automatic file uploading, please check the following:

*   **Have you set the application URL?** If you haven't set the application URL, the 'Upload' button will display an error. Please refer to the [How to enable automatic file uploading section](#how-to-enable-automatic-file-uploading) above for more information.
*   **Have you uploaded `file-uploader.php` to your server?** If you haven't uploaded `file-uploader.php` to your server, the checks performed before uploading will fail. You can upload `file-uploader.php` to your server using any FTP or SSH tool. It should be uploaded to the home folder of your app on your server.
*   **Is your application accessible over HTTPS?**. Automatic file uploading only works over HTTPS. This is to prevent anyone from intercepting the upload key and using it to upload files to your server. Make sure your server has a valid, non-self-signed SSL certificate, and make sure it's not expired.
*   **Make sure the secret upload key is correct**. The secret upload key can be retrieved from the AppGini preferences window. If it doesn't match the key in the `file-uploader.php` on your server, you can regenerate your app, then manually re-upload the new `file-uploader.php` file, overwriting the old one on the server.
    
    _**Tip:**_ You can view the secret upload key stored in the `file-uploader.php` file by opening it in a text editor. Line 2 contains the key, like so:
    
    ```php
    <?php
       define('UPLOAD_KEY', '2DF5367D046FFE742277D04B107CF46B');
    ```
    
*   **Is curl installed on your PC?**. The automatic file uploader uses curl to upload files to your server. Curl is installed by default on modern Windows machines, Linux and MacOS. On older Windows PCs, you can download curl from the [official curl website](https://curl.se/windows/).
*   **Do you have modsecurity or a similar web application firewall (WAF) installed on your server?** This might prevent the automatic file uploader from working. If you have a WAF installed on your server, you can try adding an exception for the `file-uploader.php` file to the WAF configuration. For modsecurity, you can try adding this code to a new file inside `/etc/apache/mods-enabled/` (maybe name it `appgini.conf`) or similar, then restart apache:
    
    ```apache
    <IfModule mod_security2.c>
       SecRule REQUEST_URI "/file-uploader.php$" id:300001,allow
    </IfModule>
    ```
    
    _**Hint:**_ Check your server error logs to see if modsecurity is blocking requests to `file-uploader.php` or not.
    
*   **Are you using Cloudflare?** Cloudflare is a great service for securing your website, but since it also acts as a web application firewall, it might block the automatic file uploader from working. You'll need to add an exception for the `file-uploader.php` file to [Cloudflare's firewall rules](https://developers.cloudflare.com/waf/managed-rules/waf-exceptions/).
*   **Are folder permissions/ownership set correctly?** Make sure that the folder to which you're uploading your app and any subfolder are writable by the web server software (apache, nginx, .. etc) you're using. For example, on most apache setups on linux, the user that owns the app folders should be `www-data`.
    
    You can set the ownership of the app folder and all its subfolders to `www-data` by running this command on your server:
    
    ```bash
    sudo chown -R www-data:www-data /path/to/your/app
    ```
    
    Replace `/path/to/your/app` with the actual path to your app on your server.
    
    If you're using a different web server software or a different operating system, you might need to use a different user/group name. For example, on CentOS, the user/group name is usually `apache` instead of `www-data`.
    
    If you're not sure what user/group name to use, you can check the user/group name of the web server software by running this command on your server:
    
    ```bash
    ps aux | egrep '(apache|nginx)'
    ```
    
    This will show you the user/group name of the web server software.

### Security considerations

Automatic file uploading is a great feature, but it's important to understand the security implications of it. Here are some things to keep in mind:

* **The automatic file uploader uses HTTPS**. This is to prevent anyone from intercepting the upload key and using it to upload files to your server. Make sure your server has a valid, non-self-signed SSL certificate, and make sure it's not expired.

* **The automatic file uploader uses a secret upload key**. The secret upload key can be retrieved from the AppGini preferences window, under the 'App uploader' tab.
    
    ![App uploader tab in AppGini preferences window](https://cdn.bigprof.com/images/appgini-preferences-app-uploader.png)
    
    Make sure to keep this key secret. Anyone with access to this key can upload executable files to your server and compromise it. If you think your key has been compromised, you _must immediately_:
    
    1.  Remove the `file-uploader.php` file from your server.
    2.  Generate a new key from the AppGini preferences window.
    3.  Regenerate your app and upload the new `file-uploader.php` to your server.
    
    We also recommend that you remove all app files from the server and use the automatic file uploader to re-upload them.
    
* During the upload process, the application is set to **maintenance mode**. This means that no one can access the app while it's being uploaded. After the upload is complete, the app is set back to normal mode.

* For tighter security, you can add a rule to your server firewall or to Cloudflare (if you're using it) to block access to the `file-uploader.php` file from all IP addresses except the one you're using to upload your app.
    
    If you're using Apache, you can add this rule to your `.htaccess` file or your site's Apache configuration file:
    
    ```
    <Files "file-uploader.php">
        Order allow,deny
        Deny from all
        Allow from 124.233.112.210
    </Files>
    ```
    
    Replace `124.233.112.210` with the external IP address of the PC you're using to upload your app.
    
    For nginx, you can use this rule instead:
    
    ```
    location ~* ^/file-uploader\.php$ {
      allow 124.233.112.210;
      deny all;
    }
    ```
    
    You could also specify a range of IP addresses in the above rules by using [CIDR notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#IPv4_CIDR_blocks) instead of a single IP address.
    
* **Exclude the `file-uploader.php` file from your repository**. If you're using a version control system like git, make sure to exclude the `file-uploader.php` file from your repository. This file contains the secret upload key, and you don't want to expose it to the public. To exclude the file from your repository, you can add it to your `.gitignore` file.


