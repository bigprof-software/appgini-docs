---
title: Collaboration and multi-user support
linkTitle: Collaboration
slug: help/application-features/collaboration-multi-users
description: Learn how to manage user groups and permissions in your AppGini application, and how to configure record ownership.
keywords: collaboration, multi-user, user groups, permissions, record ownership
---

# Collaboration and multi-user support

AppGini applications are designed to be used by multiple users simultaneously. Users belong to groups, 
and each group is assigned a set of permissions to access different parts of the application.
This section provides an overview of the collaboration and multi-user support features in AppGini applications.

There are two important concepts to understand when it comes to collaboration and multi-user support in AppGini applications:

1. [User groups](#user-groups)
2. [Record ownership](#record-ownership)

## User groups

Users in AppGini applications are organized into groups. Each group is assigned a set of permissions to access 
different parts of the application. Permissions include the ability to view, add, edit, or delete records in a table, 
as well as the ability to import data from CSV files.

Let's take a simple example of a small company that has a sales team, accountants and managers/admins. We can configure
the application to have three groups: Sales, Accountants, and Admins. And we can set different permissions for each group
for handling orders, customers and transactions, as shown in the following diagram:

![User groups example permissions](https://cdn.bigprof.com/images/appgini-group-permissions-diagram.png "User groups example permissions")

Organizing users into groups makes it easy to manage permissions without having to set permissions for each user individually.
A user who is assigned to the Sales team group will inherit the permissions assigned to the Sales group, and so on.

### Default user groups and the default super admin account

When you create a new AppGini application, it comes with two default user groups: **Admins** and **anonymous**. The Admins group
is assigned full permissions to all tables in the application, while the anonymous group is assigned no permissions by default.

During [application setup](../working-with-generated-web-database-application/setup.md), you are asked to create an admin user account. 
This account is automatically assigned to the Admins group and becomes the **super admin** account. The super admin account has full
permissions to all tables in the application and can manage user groups and permissions.

## Record ownership

In addition to user groups, AppGini applications support record ownership. When a user adds a record to a table, they become the **owner**
of that record, and their group becomes the **owner group** of the record. AppGini applications can be configured to provide record
owners (and/or members of the record owner group) with additional permissions, such as the ability to edit or delete their own records.

Administrators can view and manage record ownership, as well as transfer ownership of records between users and groups.

## Configuring user groups and permissions

You can configure user groups and permissions in your AppGini application by sigining in as the super admin account,
then navigating to the **Admin area**, opening the **Groups** menu and clicking on the **View groups** link. This
would display the **Groups** page, where you can view, add, edit, and delete user groups, as well as send emails
to group members, view group members, and view records owned by each group.

![Groups page](https://cdn.bigprof.com/images/appgini-groups-page-24.15.png "Groups page")

## Managing groups

If you click the group name link, or the pencil ✏️ icon to the right of a group row, you can edit the
group's details and permissions (privileges). This will open a page similar to this one below.

![Editing group permissions in an AppGini application](https://cdn.bigprof.com/images/appgini-edit-group-permissions-24.15.png?1 "Editing group permissions in an AppGini application")

Let's take a closer look at the different sections of the group editing page:

### Group name
This is the name of the group. You can change it at any time. Use a descriptive name that reflects the role of the group in your application.

### Description
This is an optional field where you can provide additional information about the group.

### View group members
Clicking this button will display a list of all members of the group. You can add or remove members from the group on this page.

### Add a new member to group
This button allows you to add a new member to the group.

### View group records
Clicking this button will display a list of all records owned by the group. You can view, edit, or delete these records on this page.
You can filter records by table, and you can also sort them creation date, last modification date, ascending or descending.

### Allow importing CSV files
If checked, members of this group will be able to [import data from CSV files](importing-exporting-data.md) into the tables they have insert or edit permissions for.

### Allow visitors to sign up
This options controls whether visitors to the application can sign up for an account. There are 3 possible values:

* **No. Only the admin can add users.** Visitors cannot sign up for an account. The admin must add users manually.
* **Yes, and the admin must approve them.** Visitors can sign up for an account, but the admin must approve their account before they can sign in.
* **Yes, and automatically approve them.** Visitors can sign up for an account, and their account is automatically approved.

> **Note:** Anonymous visitors to your application will not have the ability to sign up for an account unless 
> at least one user group is configured to allow visitors to sign up (with or without admin approval).

### Permissions

This section allows you to set permissions for the group. Permissions are set separately for each table in the application.
These permissions include the ability to insert, view, edit and delete records in a table.

When a group has permission to insert records into a table, a member user who inserts a record into that table becomes the owner of that record.
And the group of the member user becomes the owner group of the record.

For view, edit and delete permissions, you can choose one of the following options:

* **No** - Members of the group won't have that permission at all.
* **Owner** - Members of the group will have that permission only on records they own.
* **Group** - Members of the group will have that permission on all records owned by the group.
* **All** - Members of the group will have that permission on all records in the table.

![Sales group permissions example](https://cdn.bigprof.com/images/appgini-group-permissions-example.png?24.15 "Sales group permissions example")

For example, in the above screenshot, members of the "Sales" group can insert records to the "Customers" table
(to define new customers), view all records in the "Customers" table, edit only records they own, and delete only records they own.

The checkmark menu to the right of each permission allows you to set the permission for all tables at once. If you
click the checkmark menu next to the "View" permission for example, you can set the view permission for all tables
to "No", "Owner", "Group", or "All" at once.

Similarly, the checkmark menu at the right of each table allows you to set all permissions for that table at once.

### Copy permissions from another group

*Available since AppGini 24.14*

![Copy permissions from another group](https://cdn.bigprof.com/images/copy-group-permissions.png "Copy permissions from another group")

This feature allows you to copy permissions from another group. Select a group from the dropdown list to apply its permissions to the current group.
You can revert to the original permissions by clicking the ❌ icon next to the groups dropdown.

### Save changes
After you've made your changes, click the "Save changes" button to save the group settings.

### Adding a new group

To add a new group, click the **➕ Add group** button at the top right of the **Groups** page,
or open the **Groups** menu and click the **➕ Add group** link.
This will open a page similar to the group editing page, where you can set the group name, description, permissions, and other settings.

### Deleting a group

To delete a group, click the **🗑️ Delete** icon to the right of the group row on the **Groups** page.
If the group has members, this icon will be disabled. You must first remove all members from the group before you can delete it.
The anonymous group and the Admins group cannot be deleted.

> **Hint:** You can disable anonymous access to your application by removing all permissions from the anonymous group (this is the default setting).

### Sending an email to group members

To send an email to all members of a group, click the **📧 Email** icon to the right of the group row on the **Groups** page.
This will open a page where you can compose an email to the group members.

> **TIP!** You can use the **[Messages plugin](https://bigprof.com/appgini/applications/messages-plugin)** to send messages to group members directly from the application.
> The Messages plugin allows you to send messages to individual users, groups, or all users of the application, in a secure and distraction-free environment.
>
> ![Messages plugin](https://cdn.bigprof.com/images/messages/inbox-normal-user-dark.png "Messages plugin")

## Managing members (users)

The **Members** menu in the admin area allows you to manage your application's users, add new users, and view users' records.

![The members menu in the admin area](https://cdn.bigprof.com/images/appgini-members-menu.png?24.15 "The members menu in the admin area")

If you click the **View Members** link, you will see a list of all members in your application, as shown in the screenshot below.

![](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-6.png "Managing members in an AppGini application")


If you click on a username link, or the pencil ✏️ icon to the right of a member row, you can edit the member's details. This would open a page similar to the one below.

![Editing a member in an AppGini application](https://cdn.bigprof.com/images/appgini-edit-member-24.15.png "Editing a member in an AppGini application")

You can change the member's username, password, email and group.

The **Set special permissions for this user** button allows you to set special permissions for this user. This is useful if you want to give
a user special permissions that are different from the permissions of the group they belong to.

### Approving/banning members

Unchecking the **Approved** checkbox or checking the **Banned** checkbox will prevent the user from signing in.
The difference between the two is subtle, and just indicates the status of the user. An unapproved user is a user who has signed up
but has not been approved by the admin yet. A banned user is a user who has been banned by the admin. But the result is the same: the user cannot sign in.

### Custom fields

AppGini applications provide a set of custom fields that you can use to store additional information about users. 
By default, these fields are labeled as **Full Name**, **Address**, **City**, and **State**. You can change these labels to match your application's requirements. 
To do this, open the **Admin Area** » **Utilities** menu » **Admin settings**. Then click the **Sign up** tab. From there, you can change the labels of the custom fields.

### Comments field

The **Comments** field is a special field that allows you to store additional information about a user. 
This field is not displayed to the user and is intended for admin use only.

### View member's records

Clicking the **View member's records** link will display a list of all records owned by the member. You can view each record's raw data, 
or delete these records on this page. You can also assign records to another user or group.

### Send message to member

Clicking the **Send message to member** link will open a page where you can compose an email to the member.

### Delete member

Clicking the **🗑 Delete** icon to the right of the member row in the **Members** page would display a message asking you to 
confirm whether you want to delete that user. The super admin user as well as the guest user can't be deleted.

> **Hint:** You can disable guest access to your application by removing all permissions from the anonymous group (this is the default setting).

## Managing record ownership

The admin interface allows you to view all records entered by any member
or group. Click the 'View Members' Records' link on the top of the
admin homepage. This will display a page similar to the one below.


![](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-8.png "Managing records in an AppGini application")


If you click the 'Edit' icon to the left of any record, you can view
all the data in that record, and you can also edit the record ownership.
This will open a page similar to the one below.


![](https://cdn.bigprof.com/screencasts/admin-area-edit-record-ownership.png "Editing record ownership in an AppGini application")

### Batch Transfer Wizard

If you want to change the ownership of multiple records at once, you
should use the **Batch Transfer Wizard** instead of the above page.
Click on the **Batch Transfer Of Ownership** link from the **Utilities**
menu in the admin area and follow the wizard instructions. 

The 'Batch Transfer Wizard' allows you also to:

* Transfer records from one user to another.
* Transfer records from one group to another.
* Move a user and all their records to another group.

### Automatic record ownership

By default, AppGini applications are configured to automatically assign record ownership to the user who inserts a record.
However, you can change this behavior and set the record owner to the owner of the parent record. This is useful in cases where
you have a parent-child relationship between tables and you want the child records to inherit the owner of the parent record.

For more information on configuring automatic record ownership, see the [Automated record ownership](../record-owners.md) page.

### Changing a record owner from the users area

If you sign in to your application as the super admin user, and browse any table record in the application,
you will see a button with 3 vertical dots at the top right of the record details page, labeled "Admin information".
Clicking this button will display a dropdown listing the record owner and the owner group. You can click the "Change owner" link
to change the record owner to another user or group.

![Changing a record owner from the users area](https://cdn.bigprof.com/images/admin-info-menu.png "Changing a record owner from the users area")

You can also change the record owner for multiple records at once. To do this, navigate to the table view of
the relevant table, select the records you want to change the owner for, open the **More** dropdown menu at the top of the table,
and click the **Change owner** link.

![Changing a record owner for multiple records at once](https://cdn.bigprof.com/images/change-owner-multiple-records.png "Changing a record owner for multiple records at once")

