---
title: Importing Users from a CSV File in AppGini
linkTitle: Importing users
keywords: AppGini, import users, CSV, bulk import, members, groups, column mapping, password setup email, admin area
description: Step-by-step guide to bulk-importing users into an AppGini app from a CSV file, including column mapping, previewing and selecting users, assigning groups, password setup options, approval emails, import logs and troubleshooting.
slug: help/working-with-generated-web-database-application/appgini-import-users
---

# Importing users from a CSV file in your AppGini app

> This feature is available in AppGini 26.16 and later. If your app was generated with an earlier version, you can [upgrade it to the latest version](/appgini/download-pro) to get this feature.

The **Import users** page in your app's admin area lets you add many users at once from a CSV file, instead of adding them one by one. You can preview the users before importing, choose which ones to import, assign them to groups, and decide how they get their passwords.

To open it, sign in as the super admin and go to **Admin Area > Members > Import users**. You can also click the **Import users** button at the top of the **View members** page.

![AppGini admin area Members menu open, showing the Import users item below Add member](https://cdn.bigprof.com/images/appgini-admin-members-menu-import-users.png)

---

## Step 1: Prepare your CSV file

The only required column is **email**. All other columns are optional:

| Column | What it's for |
|---|---|
| `email` | The user's email address. **Required.** |
| `username` | The user's username. If left empty, a username is suggested from the email address (see below). |
| `password` | The user's password. If left empty, you choose how the password is set when importing. |
| `group` | The name of an existing group to put the user in. You can also assign groups later on the preview page. |
| Custom fields | The custom member fields of your app (such as *Full Name*, *Address*, *City* and *State*), by their names as shown on the member profile, or as `custom1` to `custom4`. |

The first row of the file should preferably contain the column names. Column names are matched loosely, so `E-mail`, `Email Address` and `email` all work, and so do `User Name`, `Username` and `login`. The columns can be in any order, and can be separated by commas, semicolons, tabs or `|`.

A file without column names works too: the email column is found by its content, and you can choose what the other columns are imported as after uploading (see [Choosing which column is imported as which field](#choosing-which-column-is-imported-as-which-field)). The same applies to columns whose names aren't recognized. Columns you don't need, such as a phone number, are simply ignored.

Here's a simple example:

```csv
email,username,password,group
jane@example.com,jane,,Sales
john@example.com,,,
```

> **Tip:** On the upload page, click **Download blank CSV template** (at the top right of the example) to get a file with all supported column names already filled in. Open it in Excel or any spreadsheet app, add your users, save it as CSV, and upload it.

To upload your file, click **Select CSV file** and choose it. The file name and size appear above the button, which changes to **Upload and preview**. To choose a different file, click the **×** next to the file name.

![AppGini Import users upload page with a selected CSV file name and size, the Upload and preview button, and the Download blank CSV template button in the example box](https://cdn.bigprof.com/images/appgini-import-users-upload-csv-page.png)

---

## Step 2: Review the users in the preview table

After you click **Upload and preview**, all users found in the file are listed in a table showing their username, email, group, whether a password was provided, any custom fields in the file, and their status. Nothing is saved yet at this point.

If the file has no users (for example, only a row of column names), an error is shown and you can upload another file.

![AppGini Import users preview table listing users from the CSV with status labels such as Email exists, Suggested username and Duplicate in file](https://cdn.bigprof.com/images/appgini-import-users-preview-table.png)

### Choosing which column is imported as which field

Above the table on the right, the **Column mapping** button shows how many columns of your file are being imported, for example *2/3*. Click it to open a window showing each column with its first row and a few sample values, and choose what each column should be imported as: email, username, password, group, one of the custom fields, or *Ignore*. Each field can be chosen for one column only, and a small check mark shows which columns will be imported. You can also tick or untick **First row contains column names** if the first row was guessed wrong. Click **Apply** to refresh the preview, or **Auto detect** to go back to the columns detected when the file was uploaded.

The window opens by itself only when no email column could be found, since there's nothing to preview until you choose one.

![AppGini Import users Column mapping window, listing each column of the file with sample values and a list to choose the field it is imported as](https://cdn.bigprof.com/images/appgini-import-users-column-mapping.png)

### Status labels

Each row may have one or more labels explaining its status:

- **Username exists:** a user with this username is already in your app.
- **Email exists:** a user with this email is already in your app.
- **Invalid email:** the email address isn't valid.
- **Invalid username:** the username is too short (less than 4 characters) or contains characters that aren't allowed.
- **Duplicate in file:** the same email or username appears earlier in the file.
- **Weak password:** the password in the file doesn't meet your app's password rules. These users can still be selected, but they'll fail when importing, and a warning tells you how many are selected.
- **Suggested username:** the file has no username for this user, so one was suggested (see below).

Usernames and emails are checked separately. This means you'll notice if, for example, the username `john` is already taken by a different person with a different email.

Rows labeled with anything other than *Weak password* or *Suggested username* can't be selected and won't be imported. Existing users are never changed by the import.

### Suggested usernames

When the file has no username for a user, one is suggested based on the part of the email address before `@`. For example, `jane.doe@example.com` becomes `jane.doe`. If that username is already taken, a number is added, such as `jane.doe2`. Usernames must be at least 4 characters long, so shorter ones are padded with zeros, for example `al@example.com` becomes `al00`.

Suggested usernames appear in an editable box, so you can change them before importing.

### Stats and filters

Above the table, a row of counters summarizes the file:

- **Users in file:** total number of users found.
- **Can be imported** and **Can't be imported:** how many users can or can't be selected.
- **Selected:** how many users you've selected so far.
- **Suggested usernames:** users whose username was suggested from their email.
- **Already exist:** users whose username or email is already in your app.
- **Invalid data:** users with an invalid email or username, or duplicated in the file.
- **Admins:** users assigned to the Admins group.
- **No group:** users not assigned to any group yet.

*Already exist* plus *Invalid data* always adds up to *Can't be imported*.

Click any counter to show only those users in the table. Click it again, or click **Users in file**, to show everyone.

![AppGini Import users stats counters above the preview table, with the No group counter clicked to filter the table](https://cdn.bigprof.com/images/appgini-import-users-stats-filters.png)

### Moving through long lists

The table shows 100 users per page by default. Use the arrows below the table to move between pages, and the **Users per page** list to show between 10 and 1000 users per page. Your choice is remembered in your browser.

---

## Step 3: Select users and assign groups

Tick the users you want to import, or use the checkbox in the table header to select all users that can be imported. When a filter is active, that checkbox selects all importable users matching the filter, across all pages.

To assign a group, select one or more users, then choose a group from the **Assign selected users to group** list above the table. If the CSV file had a `group` column, users are already assigned to the matching group.

> **Note:** Selected users with no group won't be imported. A note below the table tells you how many selected users still have no group, and how many have a weak password.

Users assigned to the **Admins** group are shown with a red *Admins* label, and a warning below the table reminds you that they'll get full access to the admin area.

![AppGini Import users preview with several rows selected, the group list open, and the warning about selected users without a group](https://cdn.bigprof.com/images/appgini-import-users-assign-group.png)

---

## Step 4: Choose how passwords are set

If some users to be imported have no password in the file, you're shown how many, and asked how to set their passwords:

- **Send each user an email with a link to set their password** *(recommended)*: each user receives an email with their username and a link where they can choose their own password. The link is valid for 7 days. After that, users can use the *Forgot password* link on the sign-in page.
- **Set a common initial password for all of them:** all these users get the same password. Users can change it later from their profile. This is useful if your server can't send emails reliably, but it's less secure, so make sure users change it.

  When you choose this option, a strong random password is suggested. You can type your own instead (it must meet your app's password rules), or use the buttons next to the field to generate a new one, show or hide it, and copy it so you can pass it on to your users.

![AppGini Import users password options, with the password setup email option selected and the common initial password option below it](https://cdn.bigprof.com/images/appgini-import-users-password-options.png)

Users who have a password in the file always use that password.

### Notifying users who have a password

Users who get their password from the file or the common password don't receive any email by default, since you're expected to give them their password yourself. To let them know their account exists, tick **Notify users who have a password...** (shown only when it applies). They'll receive an email with their username and a sign-in link. The password itself is never included in the email.

---

## Step 5: Approve users and import

The **Approve imported users** checkbox controls whether imported users can sign in right away. It's ticked by default.

If you untick it, users are imported but must be approved before they can sign in. In this case, any emails they would get (the password setup email or the account created email) are **held until you approve them**:

- When you approve a user from the **View members** page or the **Edit member** page, they receive their held email instead of the usual approval email. Any password setup link in it is valid for 7 days from approval.
- Users you never approve don't receive any email.

An explanation of this appears on the page when it applies.

![AppGini Import users page with Approve imported users unticked, showing the note that emails will be sent when each user is approved](https://cdn.bigprof.com/images/appgini-import-users-approval-email-note.png)

When you're ready, click **Import selected users** and confirm. Users are imported in small batches, with a progress bar showing how far along the import is. Please keep the page open until it finishes.

---

## Step 6: Review the summary and download the log

When the import finishes, a summary shows how many users were:

- **Imported:** added to your app successfully.
- **Skipped:** not imported because they have no group, or because a user with the same username or email was added in the meantime.
- **Failed:** not imported because of a problem, such as a password that doesn't meet your app's password rules.

The table below the summary lists only the users you selected for this import, each with its result and details, such as *Password setup email sent*.

Click **Download import log** to save a CSV file with the full details for every user: row number, username, email, group, result, details and time.

![AppGini Import users summary showing counts of imported, skipped and failed users, with the Download import log and Back to remaining users buttons](https://cdn.bigprof.com/images/appgini-import-users-summary-download-log.png)

### Importing the rest of the users

If you imported only some of the users, click **Back to remaining users** to return to the preview table without the users you've just imported. Users who were skipped or failed are still listed, so you can fix them (for example, assign a group), select them again and retry. The downloaded log includes all rounds of the same upload.

To start over with a different file, click **New import**.

---

## Frequently asked questions

**Will importing change any existing users?**

No. Users whose username or email already exists are never changed. They're marked in the preview and can't be selected.

**Some imported users didn't get an email. Why?**

Users who have a password (from the file or the common password) only get an email if you ticked the notify option. Also, if you unticked **Approve imported users**, emails are only sent when each user is approved. The import log shows what happened for each user.

**What happens if sending an email fails?**

The user is still imported, and the log shows that the email failed along with the error. Check your app's mail settings in **Admin Area > Utilities > Admin Settings**. The user can still use the *Forgot password* link on the sign-in page, or you can set their password from the **Edit member** page.

**Is the import log saved on the server?**

No. The log is only kept until you start a new import or sign out, so download it right after importing if you need to keep it.

**Can imported users be assigned to the anonymous (guest) group?**

No. The anonymous group isn't offered when assigning groups.

---

## Troubleshooting

**The upload says "No CSV file uploaded, or the upload failed", although I selected a file.**

The file is probably larger than your server allows for uploads. Split it into smaller files and import them one after the other, or ask your hosting provider to increase PHP's `upload_max_filesize` and `post_max_size` settings.

**Names or other text with accents or non-Latin letters look garbled in the preview.**

The file wasn't saved as UTF-8. In Excel, use **File > Save As** and choose **CSV UTF-8 (Comma delimited)**. In other spreadsheet apps, pick UTF-8 as the character set when saving as CSV.

**The groups in my file aren't assigned in the preview.**

The group names in the file must match existing group names in your app (upper and lower case don't matter). Groups aren't created by the import. Also, if your file has no column names, the group column isn't recognized: open **Column mapping** and choose *Group* for that column.

**The Import selected users button is disabled.**

This happens when no users are selected, when none of the selected users has a group, or when a suggested username you edited isn't valid (its box is outlined in red). Usernames must be at least 4 characters long, start with a letter or number, and contain only letters, numbers, spaces, dots, underscores and `@`.

**Clicking Import shows "You can not send emails currently".**

Some users would receive an email, but your app has no valid sender email address. Set one in **Admin Area > Utilities > Admin Settings** (in another tab, so you don't lose your selections), then click **Import selected users** again. Alternatively, choose the common initial password option and leave the notify option unticked, so no emails are needed.

**Clicking Import shows a message about the password not being strong enough.**

The common initial password you entered doesn't meet your app's password rules. Click the generate button next to the field to get a strong password, or type a stronger one.

**The progress bar stopped, or an error message appeared during the import.**

This can happen if the connection was lost, your session expired, or the server took too long, often because sending emails is slow. Users imported before the problem are already saved. To continue:

1. Reload the page and upload the same file again.
2. Users that were already imported now show **Email exists** and can't be selected, so they won't be imported twice.
3. Select the remaining users and import them.

The log of the interrupted import may be incomplete, but the **View members** page always shows who was imported. If this happens repeatedly, check your app's mail settings, or try importing fewer users at a time.

**A page says "Oops! Something went wrong with this page".**

The page's security token or your session expired, usually because the page was left open for a long time. Sign in again if needed, then start a new import.

**Some users say their password setup link doesn't work.**

The link is valid for 7 days, and only the most recent link works: if a user also clicked **Forgot password** on the sign-in page, the newer email replaces the import email. In both cases, the user can request a new link with **Forgot password**, or you can set their password from the **Edit member** page.

**Emails were sent, but users didn't receive them.**

Ask users to check their spam or junk folder. If they still can't find the email, test your mail settings in **Admin Area > Utilities > Admin Settings**. The import log shows for each user whether the email was sent successfully.
