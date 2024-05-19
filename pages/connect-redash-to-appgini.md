---
title: From Data to Dashboards, A Guide to Redash Integration with AppGini
linkTitle: Redash Integration
slug: help/connect-redash-to-appgini
keywords: redash, appgini, integration, dashboard, data visualization, sql, mysql, data source, query, visualization, chart, dashboard, alert, performance, read replica
description: Learn how to integrate Redash with AppGini to create interactive visualizations, build dynamic dashboards, and share insights with your team.
---

# From Data to Dashboards, A Guide to Redash Integration with AppGini

![Redash dashboard example](https://cdn.bigprof.com/images/redash-dashboard-example-2.png)

## What is Redash?

[Redash](https://redash.io) is an open-source data visualization and dashboarding tool that allows users to connect to various data sources, create interactive visualizations, and build dynamic dashboards. It provides a user-friendly interface for querying and exploring data, making it easier for non-technical users to access and analyze data.

Redash supports a wide range of data sources, including relational databases (e.g. MySQL databases used in [AppGini applications](https://bigprof.com/appgini/)), NoSQL databases, cloud storage services, and APIs. It allows users to write queries using SQL or other query languages specific to the data source and visualize the results in different chart types such as bar charts, line charts, pie charts, and more.

## Installing Redash on your server

Redash is a stack of several components, including a Python web application, a PostgreSQL database, a Redis server, and several other components. It can be installed on a Linux server using Docker, or on a Windows server using a virtual machine. The installation process is documented in detail in the [Redash documentation](https://redash.io/help/open-source/setup).

Setting up Redash can be a bit challenging, especially if you're not familiar with Docker. If you're not comfortable with the installation process, we can help you set up Redash for a small fee. Please [contact us](https://bigprof.com/appgini/support-request) for details.

## Connecting Redash to your AppGini application

Once you have Redash installed and running, you can connect it to your AppGini application. To do this, you'll need to create a MySQL user _with read-only access_ to your AppGini database. Why read-only access? Because Redash will be running read-only queries against your database, and it's a good idea to limit its access to avoid any accidental changes to your data.

To create a read-only user, you can use the following SQL query in phpMyAdmin or any other MySQL client:

```sql
CREATE USER 'redash'@'%' IDENTIFIED BY 'strong-password';
GRANT SELECT ON `your-database-name`.* TO 'redash'@'%';
```

Replace `strong-password` with a strong password of your choice, and `your-database-name` with the name of your AppGini database. If you're not sure about the name of your database, you can find it in the `config.php` file in your AppGini application's folder.

Once you've created the user, you can connect Redash to your AppGini database by following the steps below:

1.  Log in to Redash as an admin user.
2.  Click on the "Settings" link in the bottom-left corner of the page.
3.  Click on "Data Sources" in the left sidebar, then click on the "New Data Source" button.
4.  In the search box, type "MySQL", then click on the "MySQL" data source.
5.  You'll be asked to provide a name for the data source. You can use "AppGini" or any other name you like.
6.  In the "Host" field, enter the IP address or hostname of your MySQL server. If you're running Redash on the same server as your AppGini application, you can usually use `localhost`.
7.  Leave the "Port" field empty unless you're using a non-standard port for MySQL.
8.  Provide the username and password you created earlier.
9.  If your MySQL server is configured to use SSL, you can enable SSL by checking the "Use SSL" checkbox.
10.  Click on the "Create" button to save the data source.
11.  Next, click the "Test Connection" button to make sure Redash can connect to your AppGini database.
12.  If the connection test is successful, click on the "Save" button to save the data source.

### Here is a screencast showing the above steps

<video style="width: 100%; height: auto;" controls="" fullscreen="">
<source src="https://cdn.bigprof.com/screencasts/redash-add-appgini-mysql-data-source.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

## Creating a query in Redash

Once you've connected Redash to your AppGini database, you can start creating queries. To create a new query, follow these steps:

1.  Click on the "Queries" link in the left sidebar.
2.  Click on the "New Query" button.
3.  Select the "AppGini" data source you created earlier from the "Data Source" dropdown at the top left of the page.
4.  In the "Query" field, enter your SQL query. You can use the "Schema" tree on the left to browse the tables and fields in your database and click the » button next to a table or field to insert it into your query.
5.  Click on the "Execute" button to run the query and see the results.
6.  If the query runs successfully, click on the "Save" button to save the query. You should give it a name that describes what the query does.
7.  You can optionally click on the "Visualize" button to create a visualization of the query results. You can choose from a variety of chart types, including bar charts, line charts, pie charts, and more.
8.  Once you're done, click on the "Save" button to save the visualization.
9.  In order to be able to display the query results or visualization in a dashboard, you should click the "Publish" button. This will also make the query or visualization available to other users of Redash.

### Here is a screencast showing the above steps

<video style="width: 100%; height: auto;" controls="" fullscreen="">
<source src="https://cdn.bigprof.com/screencasts/redash-create-and-publish-query.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

> **HINT!** You can use the [DataTalk plugin for AppGini](https://bigprof.com/appgini/applications/datatalk-plugin) to create the queries you need in Redash.

The plugin allows you to create queries by just describing them in plain English. Here is a video showing how it works:

<video style="width: 100%; height: auto;" controls="" fullscreen="">
<source src="https://cdn.bigprof.com/screencasts/use-datatalk-plugin-to-create-redash-queries.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

DataTalk plugin saves you the hassle of writing complex SQL queries. And you don't need to remember the names of tables and fields in your database or even care about misspelling them. Just describe what you need in plain English and the plugin will take care of the rest!

## Creating a dashboard in Redash

![Redash dashboard example](https://cdn.bigprof.com/images/redash-dashboard-example-2.png)

Dashboards in Redash are made up of widgets. Each widget can display the results of a query or a visualization. To create a dashboard, follow these steps:

1.  Click on the "Dashboards" link in the left sidebar.
2.  Click on the "New Dashboard" button.
3.  Give your dashboard a name and click on the "Save" button.
4.  Click on the "Add Widget" button.
5.  Select the query you want to display in the widget from the "Query" dropdown.
6.  Select the visualization type you want to use from the "Visualization" dropdown.
7.  Click on the "Add to Dashboard" button to add the widget to your dashboard.
8.  You can move and resize the widget to control its position and size on the dashboard.
9.  Repeat steps 4-8 to add more widgets to your dashboard.
10.  Finally, click on the "Done Editing" button to save the dashboard.
11.  If you want to share the dashboard with other Redash users, you can click on the "Publish" button.

## Creating alerts in Redash

Redash allows you to create alerts that will be triggered when the results of a query meet certain conditions. For example, you can create an alert that will send an email to a user when the number of orders in the last 24 hours exceeds a certain threshold. To create an alert, you should configure the underlying query to automatically refresh periodically. You also need to configure alert destinations, which can be email addresses, Slack channels, webhooks, or several other destinations.

Here is an example of an alert that sends an email to the sales team when the number of orders in the last 7 days is zero:

![Redash alert example](https://cdn.bigprof.com/images/redash-alert-example.png)

## Dive deeper into Redash

Redash has a very informative video playlist on YouTube that goes into more details about creating queries and dashboards. We've included the videos below for your convenience:

<div style="position: relative; width: 100%; padding-bottom: 56.25%; overflow: hidden;">
<iframe src="https://www.youtube-nocookie.com/embed/videoseries?si=pjSO5KiJFM2Dx5UD&amp;list=PLMIFYdGfSFcwzkOL7UIN1-Zou5URg2cDE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
</div>

## Performance considerations when using Redash

Redash is a great tool for visualizing data from your AppGini application. However, users can create complex queries that can put a heavy load on your database server. Moreover, Redash allows users to create queries and dashboards that auto refresh periodically -- sometimes as frequently as every minute or so. This can put a heavy load on your database server, especially if you have a large number of users.

One way to avoid this, without limiting the functionality of Redash, is to [set up a separate read replica of your MySQL database](https://www.digitalocean.com/community/tutorials/how-to-set-up-replication-in-mysql) and connect Redash to it instead of the main database. This way, Redash users will be querying the read replica instead of the main database, and this will not affect the performance of your AppGini application.

## Conclusion

Throughout this tutorial, we've covered the integration of [Redash](https://redash.io/) with [AppGini](https://bigprof.com/appgini/) to unlock advanced data visualization and dashboarding capabilities. You've learned how to set up Redash on your server, connect it to your AppGini database with enhanced security through read-only access, and utilize the [DataTalk plugin](https://bigprof.com/appgini/applications/datatalk-plugin) to facilitate query creation without deep SQL knowledge. The step-by-step guidance provided should now empower you to create insightful visualizations, build interactive dashboards, and share your findings with ease.

As you apply these new skills, keep in mind the performance considerations vital for maintaining your application's responsiveness—especially the strategy of employing a read replica for your database to mitigate the load from complex and frequent queries. With Redash as your tool of choice, you are well-positioned to elevate the data experience for your team and stakeholders, ensuring your data is not just informative but also actionable.

