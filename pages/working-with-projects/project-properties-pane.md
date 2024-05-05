---
title: Project properties pane
linkTitle: Project properties
slug: help/working-with-projects/Project-properties-pane
---

# Project properties pane

![Project properties pane](https://bigprof.com/appgini/sites/default/files/appgini-project-pane.png)




![chrome_0tJFC2fyVE](https://github.com/bigprof-software/appgini-docs/assets/168858457/a209b0e8-d4fc-4271-bee6-9c9174d9b359)


### New table
access the "New Table" option:
There are two ways to achieve this:
Toolbar icon:
Look for the New Table icon on the AppGini toolbar. It might resemblea table icon with a plus sign.
Menu option: Go to the "Tables" menu (might belabeled differently depending on your version) and select "New Table".
Define thenew table: A window will appear where you can define the details of your new table:
Table name: Enter a clear and descriptive name for your table.
Fields: Define thedata fields (columns) your table will contain. Specify the data type for each field(text, number, date, etc.)

### Generate app
Make sure you've defined all the tables, fields, relationships, and configurations youwant for your application.

Look for the "Generate App" button on the AppGini toolbar. It's depicted by amagic wand icon
After choosing the output folder, A window will pop up askingyou to select a location on your computer where you want the generated
application files to be saved. You can choose an existing folder or create a new one.

### Open app
clicking the "Open App" button will launch the web application you've been building in AppGini.



![chrome_lxaTsi13nQ](https://github.com/bigprof-software/appgini-docs/assets/168858457/fe10000a-bfd0-4b48-b2d8-6e044e4f4488)


## Application appearance
### Number of tables per row in the homepage
This setting determines how many tables are displayed side-by-side in a row on the application's homepage.

### Make first table in the homepage extra wide?
This option allows you to visually emphasize the first table on the homepage by making its column wider than the others.

### Height of table panel in the homepage (pixels)
This setting controls the height of the area allocated to displaying tables on the application's home page.

### Edit theme
This button opens a separate window where you can choose from a variety of pre-designed themes to change the overall look and feel of your application, such as color schemes, fonts, and button styles.


![AppGini_Ix0r5QCV9u](https://github.com/bigprof-software/appgini-docs/assets/168858457/bc013653-b1c9-494c-8bc0-61eddf8d428b)

## localization Settings
### Date/time preview 
This setting controls the format used to display dates within the application. Youcan choose from a predefined list of formats that include the order of day, month,and year, as well as separators like "/" or "-".

### Date order
You can choose the order to display the day, month, and year. Common formats include month/day/year
(e.g., 10/31/2024) or day/month/year (e.g., 31/10/2024).

### Separator
You can specify the character used to separate the day, month, and year parts of a date.
Common choices include slash "/" or hyphen "-".

#### Use 24hr time format
This option determines whether to display time in 24-hour format
(e.g., 14:00) or 12-hour format (e.g., 2:00 PM).


### Character encoding
This setting specifies the character encoding used to store and display text data within the application. Choosing the correct encoding ensures that all characters, including special characters and accented letters, are displayed properly for the target language.

#### Don't enforce MySQL encoding
This option might be related to the database character encoding used to store application data. Enabling it give AppGini more control over the character >encoding used within the application itself.

![AppGini_bsyIZkyYIP](https://github.com/bigprof-software/appgini-docs/assets/168858457/31ccb77a-26e9-40a4-9f31-1168be2c3dca)
### Language files
To create or edit files containing translations for different languages.

### Time zone
This setting allows you to specify the time zone the application will use. This is important for displaying dates and times accurately for your users.


![AppGini_mkESdR9met](https://github.com/bigprof-software/appgini-docs/assets/168858457/7f59ca35-ee27-4b63-8d3f-6d0a99482078)

### Hide the login/membership system
Enabling this option would remove the standard login functionality from the generated web application. This might be useful if you intend to integrate a separate login system or your application doesn't require user accounts.

### Allow admin access to interactive SQL tool
This setting controls access to a built-in tool that allows executing SQL queries directly on the database. Granting access to this tool can be risky, so it's recommended to only enable it for trusted administrators and during development stages.

### Allow admin access to server status page
This option determines whether admins can access a server status page that might display sensitive information about the server environment. Similar to the previous option, it's recommended to disable this for security reasons in production environments.

### Allow admin access to table view SQL
This setting controls whether admins can view the underlying SQL code used to generate table views within the application.  While this might be helpful for debugging purposes, it's not essential for regular application usage and can be disabled for security.

### Change the upload key
This button likely allows you to generate a new secret key used for various purposes within the application, potentially including encryption. It's recommended to keep this key secure as it might be used to tamper with data or unauthorized actions.

### Application URL
This setting allows you to specify the base URL where your generated AppGini application will be accessible after deployment.

![AppGini_YR8vsYvJLv](https://github.com/bigprof-software/appgini-docs/assets/168858457/4b107d4d-bac9-4621-a83a-0dbac4fda3fb)


### Show technical documentation page in the admin area
This option controls whether a dedicated page for viewing the technical documentation is accessible within the admin area of your AppGini application.

### Edit
This button would allow you to edit the content of the technical documentation. AppGini might provide a text editor or a similar tool to write and format the documentation.






