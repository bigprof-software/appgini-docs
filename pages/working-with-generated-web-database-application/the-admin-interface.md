---
title: The admin interface
linkTitle: The admin interface
slug: help/working-with-generated-web-database-application/the-admin-interface
---

# The admin interface



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

## Some features of the admin interface


-   Managing user groups and users.
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



