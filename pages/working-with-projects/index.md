---
title: AppGini projects
description: Learn how to work with AppGini projects, create new projects, and save them.
keywords: appgini projects, appgini project window, appgini new project, appgini project browser, appgini project properties, working with projects
linkTitle: Working with projects
slug: help/working-with-projects
---

# AppGini projects

## What is an AppGini project?

To create a web database application using AppGini, you start by creating a project. In the project, you define your database tables and fields, and configure your application's appearance and behavior. Once you have finished working on your project, you can generate the PHP code for your application by clicking the "Generate" button on the toolbar or pressing F5. AppGini will then save the generated code to a folder of your choice. Finally, you can deploy the generated files to your web server.

![The Generate button on the toolbar.](https://cdn.bigprof.com/appgini-desktop/help/magic-stick.png)

## How do I start a new project?

To start a new project in AppGini, follow these steps:

1. Launch AppGini.
2. From the File menu, select New, or click the 'New Project' icon on the toolbar.
3. A new project window will appear, as shown below.
4. By default, the project is named 'new_db'. To change the name, click on the project name at the top of the left section (the project browser pane), then press **` F2 `** and type the new name.

### The project name

Note that the project name you specify in AppGini doesn't have to match the name of the database on your server. It's used only for display purposes and will be used as the basis for the application title, which is displayed at the top of the project properties pane (see the screenshot below) and in the generated application's title bar.

> You can configure the actual database name and credentials during the generated application setup, which is explained in detail [here](/appgini/help/working-with-generated-web-database-application/setup).

## The project window

![New project window](https://cdn.bigprof.com/appgini-desktop/help/appgini-new-project-24.12.png)

This is your working area. This window has two sections: the project browser pane at the left lets you view your project components (the project, tables and fields) in an easy to navigate hierarchical manner. The right section is the properties pane. When you click on any item in the project browser, its properties are displayed in the properties pane.

At the bottom of the project window, you'll find the project search box. You can use this box to quickly find any item in your project by typing a few characters of its name.

## How do I save a project?

In the professional version of AppGini, projects can be saved as project files, with the extension `.axp`. You can open them later to continue working on your project or modify it. The freeware version can open project files but can not save changes to them.

To save a project, click the 'Save' icon on the toolbar or press **` Ctrl `** + **` S `**. You'll be prompted to choose a location to save your project file if you haven't saved it before. You can also save your project by selecting 'Save' from the File menu.

> Note: Saving a project file doesn't save the generated application files. To save the generated application files, you need to click the 'Generate' button on the toolbar or press **` F5 `**.

## Auto save of projects

You can configure AppGini to automatically save your project every few minutes. To do this, click the 'AppGini Preferences' icon on the toolbar, then check the 'Auto-save interval (minutes)' option and specify the interval in minutes.

## Opening an existing project

When you launch AppGini, you'll see the 'How do you want to begin?' dialog. You can choose to start a new project, open an existing project, or open last project. If you don't see this dialog, it means you've disabled it before. You can enable it again by checking the 'Show how do you want to begin' option in the 'AppGini Preferences' dialog.

You can also open an existing project by selecting 'Open' from the File menu or clicking the 'Open Project' icon on the toolbar. Then, navigate to the location of your project file and select it.

## Advanced: The project file format

AppGini project files have the extension `.axp`. They are XML files that store all the information about your project, including the tables, fields, and their properties, as well as the project settings. You can open an `.axp` file in a text/code editor to see its contents. You can also make modifications to the file, but be careful not to corrupt it, as this may prevent you from opening the project in AppGini.

