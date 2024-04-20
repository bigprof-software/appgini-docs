---

title: The admin interface
linkTitle: The admin interface
slug: help/working-with-generated-web-database-application/the-admin-interface

---



AppGini allows you to create member accounts and control the privileges
of members. For each table in your application, you can control whether
members can add new records, edit existing ones, and/or delete records.
Moreover, you can control which records a member can edit and/or delete:
only his own records (records added by the member himself), or his
group's records (records added by any member of the group to which our
member belongs), or all records entered by him and any other member of
any group.

## Member groups

To make administration of members easier, AppGini allows you to create
groups and assign each member to a group. Thus, instead of assigning
privileges to each individual member separately, you assign privileges
to a group. All members of the group are then automatically assigned
these privileges.

### Sample scenario: A content publishing application

For example, if you are developing a content publishing application, you
might create an authors group that has the privilege to add new records
to the articles table. Each member of the authors group can edit his own
records (articles), but not the articles of other members (authors).

You would also create an editors group. Members of this group can edit
any record in the articles table, but are not allowed to delete or add
records.

Finally, you might create a subscribers group. Members of this group can
only read articles (that is, view records of the articles table), but
not edit, delete or add records.

## Accessing the admin homepage

The admin interface allows you to define groups and their privileges,
approve and ban members, send email notifications to groups or
individual members, plus other administrative tasks.

You can access the admin interface by signing in as an admin user, then clicking the 'Admin area' link at the top of the page. This will take you to the admin homepage, similar to the one below.

!["The admin homepage of an AppGini application"](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-2.png "The admin homepage of an AppGini application")

After signing in, you'll see the admin homepage, which provides a quick
review of latest events: newest members, most active members, newest
records and updates, plus links to all admin tools.

## Managing groups

To view available groups, click the 'View Groups' link on the top of
the admin homepage. This would display a page similar to this one
below.


![Managing user groups in an AppGini application](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-3.png "Managing user groups in an AppGini application")


If you click the \"Edit\" icon to the left of a group, you can edit the
group's details and permissions (privileges). This will open a page
similar to this one below.


![](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-4.png "Editing group permissions in an AppGini application")


Scrolling down the group editing page, you'll see the group's
permissions for each table. If you pass your mouse pointer over any item
in the permissions section, you'll see a detailed description of what
it means.


![](https://cdn.bigprof.com/screencasts/admin-area-edit-group-permissions.png "Editing group permissions in an AppGini application")



In AppGini 5.80 and above, the buttons with checkmarks to the right of
each permission allow you to apply the same permission value to all
tables in one step. Clicking that button opens a menu, as shown at the
right. If you click on *Set all to **Group***, for example, all tables
will have the 'View' permission set to 'Group'.

![](https://cdn.bigprof.com/screencasts/admin-area-mass-edit-permission-for-all-tables.png)


To define a new group, open the *Groups* menu at the top of any admin
page, and click the *Add Group* command. This will open a page similar
to the group editing page but with empty fields for you to fill.

## Managing members

To view available members, click the 'View Members' link on the top of
the admin homepage. This would display a page similar to this one below.

![](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-6.png "Managing members in an AppGini application")


If you click the \"Edit\" icon to the left of a member, you can edit the
member's details. This will open a page similar to this one below.


![](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-7.png "Editing member details in an AppGini application")


Note that AppGini allows you as an admin to ban (suspend) members
temporarily. A banned member will not be able to sign in. You can unban
him at any time later.

## Managing records

The admin interface allows you to view all records entered by any member
or group. Click the 'View Members' Records' link on the top of the
admin homepage. This will display a page similar to the one below.


![](https://cdn.bigprof.com/appgini-desktop/help/the-admin-interface-8.png "Managing records in an AppGini application")


If you click the 'Edit' icon to the left of any record, you can view
all the data in that record, and you can also edit the record ownership.
This will open a page similar to the one below.


![](https://cdn.bigprof.com/screencasts/admin-area-edit-record-ownership.png "Editing record ownership in an AppGini application")


If you want to change the ownership of multiple records at once, you
should use the 'Batch Transfer Wizard' instead of the above page.
Click on the 'Batch Transfer Wizard' link in the admin homepage and
follow the wizard instructions. The 'Batch Transfer Wizard' allows you
also to move members of a group to another group if you want to.

## Other features of the admin interface


-   In addition to the above, you can use the admin interface to send
    email notifications to all groups by clicking the 'Send a message
    to all groups' link in the admin homepage.
-   The 'Admin settings' link in the admin homepage allows you to
    adjust several administrative settings. These include:
    -   Changing the admin username and password.
    -   Changing the name and email used for the sender details when
        sending email notifications to groups or members.
    -   Define/customize up to 4 info fields that new members are asked
        to fill during sign-up.
    -   Customize the contents of the email sent to new members when
        they are approved.
    -   Customize the date format used to display dates in the admin
        interface.
    -   Customize the number of rows to display per page in the 'View
        Groups', 'View Members' and 'View Member's Records' pages.
    -   Define the default sign-up mode for new groups.
    -   Change the name of the anonymous group and anonymous member.

