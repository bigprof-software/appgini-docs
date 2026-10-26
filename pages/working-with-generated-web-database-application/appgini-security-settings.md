---
title: Security Settings in Your AppGini App
linkTitle: Security settings
keywords: AppGini, security settings, inactivity logout, session timeout, single session, multiple tabs, strong passwords, password expiry, email change, LDAP, admin settings
description: How to configure the Security tab in AppGini admin settings, including inactivity logout, single session per user, single tab, strong password rules, password expiry and password confirmation for email changes, plus LDAP notes and FAQs.
slug: help/working-with-generated-web-database-application/appgini-security-settings
---

# Security settings in your AppGini app

> This feature is available in AppGini 26.16 and later. If your app was generated with an earlier version, you can [upgrade it to the latest version](/appgini/download-pro) to get this feature.


The **Security** tab on your app's admin settings page controls how users sign in, how long sessions last, and how strong passwords must be. All options are off by default except one (asking for a password before an email change), so upgrading your app doesn't change how your users work until you turn something on.

To open it, sign in as the super admin, go to **Admin Area > Utilities > Admin Settings**, and click the **Security** tab. You can also open the tab directly at `admin/pageSettings.php#security-settings` in your app.

![The Security tab in AppGini admin settings, showing the inactivity logout, single session, single tab, strong password, password expiry and email change options](https://cdn.bigprof.com/images/appgini-admin-settings-security-tab.png)

After changing any option, click **Save changes** at the top of the settings page.

---

## Log out after a period of inactivity

**Setting:** *Log out after inactivity (minutes)*. **Default:** `0` (disabled).

Users who don't interact with the app for this many minutes are signed out automatically. This protects data on shared or unattended computers.

- Moving the mouse, typing, scrolling or tapping counts as activity, even if no page is loaded. A user typing a long note in a form won't be logged out while typing.
- Activity in any tab of the app counts for all of that user's tabs in the same browser.
- Automatic background updates (such as record counts on the homepage) don't count as activity.
- After being logged out, the user sees a message on the login page explaining why.

![AppGini login page showing the message that the user was logged out due to inactivity](https://cdn.bigprof.com/images/appgini-logged-out-due-to-inactivity-message.png)

> **Note:** While this option is on, the **Remember me** checkbox is hidden from the login page and existing "remember me" sign-ins are ignored. Otherwise users would be signed back in silently, which would defeat the purpose of the timeout.

**Suggested values:** 15 to 30 minutes for apps holding sensitive data; 60 minutes or more for general use. The settings page shows a warning if you set a value below 5 minutes, since such short timeouts tend to log users out during normal use.

---

## Log user out of old session if a new one is opened

**Setting:** *Log user out of old session when a new one is opened*. **Default:** off (users can sign in from several devices at once).

When on, each user can only be signed in from one device or browser at a time. If a user signs in on a new computer, their session on the other computer ends the next time it's used, and the user sees this message there:

![AppGini login page showing the message that the user was logged out because their account signed in from another device](https://cdn.bigprof.com/images/appgini-logged-out-signed-in-from-another-device.png)

This helps you:

- stop users from sharing one account between several people;
- make sure a forgotten session on another computer can't be used.

The old device can't sign back in silently with **Remember me** either.

If your app uses **two-factor authentication (2FA)**, the other session ends only after the new sign-in is completed with the verification code. Someone who only knows the password can't log the real user out.

---

## Don't allow multiple tabs/windows for the app

**Setting:** *Don't allow multiple tabs/windows for the app*. **Default:** off.

This option is only available when **Log user out of old session** (above) is on.

When on, each user can have the app open in only one browser tab or window. If they open a second one, it shows a message with a **Use here** button. Clicking it makes that tab the active one and blocks the other tab instead.

![AppGini app tab blocked with a message that the application is already open in another tab, with a Use here button](https://cdn.bigprof.com/images/appgini-app-already-open-in-another-tab.png)

Pop-ups shown *inside* the app, such as child records or adding a new item from a drop-down, aren't affected. Opening an app page in a new browser tab or window (for example with a middle-click) counts as a second tab.

> **Note:** This check runs in the user's browser. Use it to keep users working in one place and avoid conflicting edits, not as a strict security barrier.

---

## Force strong passwords

**Setting:** *Force strong passwords*. **Default:** off.

When on, every new password must:

- be at least **10 characters** long, and
- include **upper case** letters, **lower case** letters, **numbers** and **symbols**.

For example, `Summer2024` is rejected (no symbol), while `Summer#2024` is accepted. Spaces at the start or end of a password are ignored, so they don't count toward the length.

The rule applies everywhere a password is set: sign-up, the user's profile page, password reset, the admin's own password, and when an admin creates or edits a member. As users type, a hint under the password field tells them what's missing.

![AppGini change password form showing the strong password requirements hint under the new password field](https://cdn.bigprof.com/images/appgini-strong-password-requirements-hint.png)

**Users who already have a weak password** can still sign in, but are then taken straight to their profile's password tab and asked to change it before they can continue. Once they've changed it, they continue to the homepage, where a message confirms the change. The super admin is taken to the admin password field on the settings page instead.

![AppGini profile page asking the user to change a weak password before continuing](https://cdn.bigprof.com/images/appgini-change-weak-password-prompt.png)

> **Tip:** The password strength meter always follows these rules, even when this option is off. A password your users see rated as *strong* today will still be accepted if you turn this option on later.

---

## Force changing passwords every few days

**Setting:** *Force changing passwords every (days)*. **Default:** `0` (disabled).

When set, users must choose a new password once their current one is older than this number of days. When it expires, they are taken to the password change form after signing in, and the new password must be different from the old one.

- When you first turn this on, the age of existing passwords is counted **from that day**, so no one is locked out straight away.
- Any password change resets the countdown, including a password reset by email or a new password set by an admin.

![AppGini profile page notifying the user that their password has expired and must be changed](https://cdn.bigprof.com/images/appgini-password-expired-change-required.png)

**Suggested values:** 90 or 180 days. Very short periods tend to push users toward predictable passwords, so the settings page shows a warning if you set a value below 30 days.

---

## Ask user for password if they change their email address

**Setting:** *Ask users for their password when changing their email address*. **Default:** on.

When a user changes their email on their profile page, a **Current password** field appears and must be filled in correctly before the change is saved. Other profile fields can be updated without a password.

Password reset links are sent to this email address. So this stops someone using an unattended signed-in session from switching the email to their own and then taking over the account.

![AppGini profile page asking for the current password before saving a changed email address](https://cdn.bigprof.com/images/appgini-confirm-password-to-change-email.png)

---

## Using LDAP sign-in

If your app signs users in through **LDAP** (set in the **LDAP** tab), their passwords are managed by your LDAP server, not by the app. In that case:

- **Force strong passwords** and **password expiry** don't apply to anyone, since all users sign in through LDAP. This includes the **super admin**, so make sure the admin username exists on your LDAP server before enabling LDAP. The Security tab marks these options to remind you.
- **Ask for password when changing email** checks the password against your LDAP server.
- All other options work normally.

![AppGini Security settings tab with a notice that some password options don't apply when LDAP sign-in is enabled](https://cdn.bigprof.com/images/appgini-security-settings-ldap-notice.png)

---

## Quick reference

| Option | Default | Applies to LDAP users |
|---|---|---|
| Log out after inactivity (minutes) | `0` (off) | Yes |
| Log user out of old session | Off | Yes |
| Don't allow multiple tabs/windows | Off | Yes |
| Force strong passwords | Off | No |
| Force changing passwords every (days) | `0` (off) | No |
| Ask for password when changing email | **On** | Yes (checked by LDAP) |

## Frequently asked questions

### "I was logged out during my coffee break"

**A user stepped away for a few minutes and came back to the login page. Is this a bug?**
No. The inactivity logout option is on, and they were away longer than the number of minutes you set. Sign-outs during short breaks mean the timeout is shorter than your users' normal routine. Consider 30 to 60 minutes unless your data is very sensitive.

**A user was reading a long record without touching the mouse or keyboard and got logged out.**
Reading alone doesn't count as activity. Only moving the mouse, typing, scrolling or tapping does. Scrolling now and then while reading keeps the session alive.

**A user lost what they were typing when they were logged out.**
Unsaved changes in a form are lost when the session ends. Typing itself counts as activity, so this only happens if the form was left untouched for the whole timeout. Advise users to save before stepping away.

**A user had the app open in two tabs and worked in only one. Will the other tab log them out?**
No. Activity in any tab counts for all tabs of the app in the same browser.

### "I signed in on my phone and got logged out on my PC"

**A user signed in from their phone, and their PC session ended. Why?**
**Log user out of old session** is on, so each user can be signed in from only one device at a time. Signing in on the phone ends the PC session, and signing in on the PC again ends the phone session. If your users routinely switch between devices, consider turning this option off.

**A user is logged out on the same computer they're using. They didn't sign in anywhere else.**
Each browser counts as a separate device. So does a private or incognito window. Signing in from Chrome logs out the same user in Firefox on the same computer. Also check that nobody else is using the same account: two people sharing one account will keep logging each other out. This option is designed to make account sharing obvious.

**A user doesn't recognize the device that logged them out.**
Someone else may know their password. Ask the user to change it right away. You can also set a new password for them yourself in **Admin Area > Members > View Members**.

### "The app says it's already open in another tab"

**A user opened a new tab or window and got a message saying the app is already open elsewhere.**
**Don't allow multiple tabs/windows** is on. The app can be open in only one tab per user. This includes:

- opening a link in a new tab (middle-click, or right-click > *Open in new tab*);
- opening the app from a bookmark or an email link while it's already open in another tab;
- the browser restoring several app tabs after a restart: only one of them stays usable.

The user can either go back to the original tab, or click **Use here** to continue in the new one.

**A user clicked "Use here" and the other tab stopped working.**
That's expected: only one tab can be active, so the other tab now shows the message instead. Clicking **Use here** in the other tab switches back, but that tab reloads, so any unsaved changes in it are lost. If the other tab has unsaved work, go back to it and save it first, before using the app anywhere else.

**A user closed the other tab, but the message still shows.**
Click **Use here**. The tab becomes the active one.

**Pop-ups inside the app are fine, though?**
Yes. Pop-ups shown inside the app, like child records or adding a new item from a drop-down, are part of the tab they open in, and are never blocked.

### "Why do I have to change my password?"

**A user has used the same password for years and is suddenly forced to change it.**
Either **Force strong passwords** was turned on and their password doesn't meet the rules, or **password expiry** is on and their password got too old. The message on the password page says which. A weak password is detected when the user signs in, so users already signed in are only asked after their next sign-in.

**A user's new password is rejected even though it looks strong to them.**
It must be at least 10 characters and contain upper case letters, lower case letters, numbers and symbols. All four are required. Spaces at the start or end don't count toward the length. The hint under the password field shows the rules while typing.

**A user tried to set their password back to the old one and it was rejected.**
When changing a password, the new one must be different from the current one.

**A user wants to change their email but the app asks for their password.**
**Ask for password when changing email** is on. It protects the account, since password reset links go to that email address. If the user forgot their password, they can reset it from the login page first, or you can set a new one for them.

### Other questions

**A user is stuck on the password change page. How can I let them in?**
They need to set a password that meets the rules. As the admin, you can also set a new password for them in **Admin Area > Members > View Members** (edit the member). This counts as a password change.

**Why did the "Remember me" checkbox disappear from the login page?**
The inactivity logout option is on. Set it to `0` to bring the checkbox back.

**Do these settings affect guest (anonymous) visitors?**
No. They apply only to signed-in users.

**Will users see these messages in their own language?**
Yes. All messages come from your app's language files. Strings that haven't been translated yet are shown in English.
