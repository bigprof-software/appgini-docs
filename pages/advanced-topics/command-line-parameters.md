---
title: Command-line parameters
linkTitle: Command-line parameters
slug: help/advanced-topics/command-line-parameters
description: Command-line parameters to automate AppGini, including generating apps from project files, specifying output paths, and uploading apps to servers.
keywords: command-line parameters, generate, output, upload, log, CI/CD, deployment
---

# Command-line parameters

> **Command-line parameters work only with [AppGini Pro](https://bigprof.com/appgini/pricing).**

You can use command-line parameters to automate AppGini. For example, you can add a command to generate an AppGini application as part of your deployment workflow in a batch/script file. Currently, the following parameters are supported:

## `--generate "path\to\project\file"`  

(Added in AppGini 5.11). Generates application from provided AXP project file, using the output path and file overwriting settings stored in the project file, then quits. If the path to the project file contains spaces, use double-quotes around the project path.

## `--log "path\to\log\file"`  

(Added in AppGini 5.81). Specifies a path to a log file to save the output log to when generating an app. If the log file path contains spaces, use double-quotes around it.

## `--open "path\to\project\file"`

(Added in AppGini 5.73). Opens the specified project file in AppGini. If the path to the project file contains spaces, use double-quotes around the project path.

## `--output "path\to\ouput\folder"`  

(Added in AppGini 5.73). Specifies output path to use when generating an application, overriding the path stored in the project file. A project file must be specified using `--generate`. If the output path contains spaces, use double-quotes around the output path.

## `--upload "https://domain.com/app-path"`

(Added in AppGini 24.19). Uploads the generated app to the specified URL. The URL should point to the root of the AppGini app on the server. If the URL is not provided, the app will be uploaded to application URL specified in the project file. This option must be combined with `--generate` or `--open` to specify the project file. If combined with `--generate`, the app will be generated first then uploaded. If combined with `--open`, the app will be uploaded without generating it. For more information on uploading apps, see [Uploading AppGini apps](../application-uploader.md).

This feature is great for automating deployment of AppGini apps, and can be used as part of a CI/CD (Continuous Integration/Continuous Deployment) pipeline. See the example in [Deploying one app to multiple servers](#deploying-one-app-to-multiple-servers) below.

## Examples

This following command would launch AppGini and generate an application from myapp.axp to the folder stored in the project file.

```
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp
```

This following command would launch AppGini and generate an application from myapp.axp to the folder `C:\xampp\htdocs\myapp2` -- overriding the folder stored in the project file if different. If the specified folder doesn't exist, AppGini will attempt to create it.

```
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp --output C:\xampp\htdocs\myapp2
```

This following command would launch AppGini, generate an application from myapp.axp, and save output log to `C:\logs\myapp.log`.

```
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp --log C:\logs\myapp.log
```

## Deploying one app to multiple servers

You can use the `--generate` and `--upload` parameters to deploy the same app to multiple servers. For example, the following batch file would generate an app from `myapp.axp` and upload it to three different servers:

```batch
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp --upload https://server1.com/myapp
"C:\Program Files\AppGini\AppGini" --open C:\projects\myapp.axp --upload https://server2.com/myapp
"C:\Program Files\AppGini\AppGini" --open C:\projects\myapp.axp --upload https://server3.com/myapp
```

We only need to generate the app once, then open the project file and upload it to each server.

