---
title: Command-line parameters
linkTitle: Command-line parameters
slug: help/advanced-topics/command-line-parameters
---

You can use command-line parameters to automate AppGini. For example, you can add a command to generate an AppGini application as part of your deployment workflow in a batch/script file. Command-line parameters work only with AppGini Pro. Currently, the following parameters are supported:

`--generate "path\to\project\file"`  
(Added in AppGini 5.11). Generates application from provided AXP project file, using the output path and file overwriting settings stored in the project file, then quits. If the path to the project file contains spaces, use double-quotes around the project path.

`--output "path\to\ouput\folder"`  
(Added in AppGini 5.73). Specifies output path to use when generating an application, overriding the path stored in the project file. A project file must be specified using `--generate`. If the output path contains spaces, use double-quotes around the output path.

`--log "path\to\log\file"`  
(Added in AppGini 5.81). Specifies a path to a log file to save the output log to when generating an app. If the log file path contains spaces, use double-quotes around it.

#### Examples

```
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp
```

This would launch AppGini and generate an application from myapp.axp to the folder stored in the project file.

```
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp --output C:\xampp\htdocs\myapp2
```

This would launch AppGini and generate an application from myapp.axp to the folder `C:\xampp\htdocs\myapp2` overriding the folder stored in the project file if different. If the specified folder doesn't exist, AppGini will attempt to create it.

```
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp --log C:\logs\myapp.log
```

This would launch AppGini and generate an application from myapp.axp, and save output log to `C:\logs\myapp.log`.
