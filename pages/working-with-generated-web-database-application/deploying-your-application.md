---
title: AppGini Deployment Guide
linkTitle: Deploying your application
keywords: AppGini, deployment, cPanel, Plesk, shared hosting, VPS, cloud, Windows Server, Docker, MySQL, MariaDB, PHP, automatic uploader, managed database
description: Practical guide to deploy AppGini-generated PHP apps to shared hosting (cPanel/Plesk), VPS/cloud, Windows Server, and Docker. Includes pre-deployment database/user creation steps, setup guidance, and best practices.
slug: help/working-with-generated-web-database-application/deploying-your-application
---

# AppGini Deployment Guide

This guide explains how to deploy AppGini-generated applications across shared hosting, VPS/cloud servers, Windows Server, and Docker-based setups. It also covers managed databases and best practices.

**Important context:**

- AppGini apps are lightweight PHP 8+ web apps backed by MySQL/MariaDB.
- Required PHP extensions: mysqli, gd, iconv, json.
- AppGini (Windows) [generates your web app files into a folder](../working-with-projects/generating-the-php-application.md).
- There are basically two deployment methods:
   - Manually upload all files (FTP/SFTP/File Manager).
   - Recommended: Upload only `file-uploader.php` once, then [use AppGini’s built-in “Upload” button to push changed files over HTTPS](../application-uploader.md).

---

## Server requirements

- PHP: 8.0 or newer.
- PHP extensions: mysqli, gd, iconv, json.
- Database: MySQL or MariaDB.
- Web server: Apache or Nginx (Apache with mod_php or PHP-FPM; Nginx with PHP-FPM). IIS also supported (see Windows Server section).
- HTTPS: Strongly recommended (mandatory if using AppGini’s automatic uploader).
- File permissions: The app directory should be writable by the web server user (for example, `www-data` on Debian/Ubuntu Apache, `apache` on CentOS/RHEL).
- Memory and CPU:
    - Shared hosting: works for small apps.
    - VPS/Cloud: at least 1 GB RAM recommended for smooth operation (2+ GB if using Docker).
- Optional: GD library on server to display setup captcha, as well as create thumbnails for image uploads.

---

## Deploying to cPanel or Plesk shared hosting

cPanel and Plesk are widely popular web hosting control panels for managing shared hosting accounts.
They provide a user-friendly interface to manage files, databases, domains, email, and more.

Before uploading the app, create the database and database user.

### Creating a database and user in cPanel

![cPanel MySQL Databases](https://cdn.bigprof.com/images/cPanel-MySQL-Database-Wizard-button-screenshot.png)

- Log in to cPanel.
- Open MySQL Databases.
- Create a new database (for example, myapp_db).
- Create a new MySQL user and set a strong password.
- Add the user to the database and grant ALL PRIVILEGES.
- Note the DB name, DB user, DB password, host (often `localhost`), and port (usually 3306).

### Creating a database and user in Plesk

![Plesk Add Database](https://cdn.bigprof.com/images/plesk-create-mysql-db-and-user.png)

- Log in to Plesk.
- Go to Databases > Add Database.
- Enter a database name and select the related subscription/domain.
- Create a new database user with a strong password and assign it to the database.
- Note the DB name, user, password, host (often `localhost` or `127.0.0.1`), and port (3306).

You can deploy in two ways after DB creation.

### Upload zip via File Manager, then unzip

- Generate the app in AppGini on your PC and zip the generated app folder.
- In cPanel: open File Manager and navigate to `public_html` (or a subfolder). In Plesk: navigate to `httpdocs` (or a subfolder).
- Upload the zip file and extract it into the target folder.
    
    ![cPanel File Manager Extract](https://cdn.bigprof.com/images/cpanel-extract-zip-file.png)

- **Important:** Ensure `config.php` and `setup.md5` from your local tests are NOT present on the server before setup (remove if accidentally included).
- Browse to your site URL (for example, https://yourdomain.com/ or https://yourdomain.com/myapp/).
- [First-run setup](./setup.md):
    - If captcha is shown, solve it. If GD is missing on the server, captcha may not appear.
    - Enter the database host (usually `localhost`), database name, MySQL username, password, and port (3306).
    - Define the app admin username, email, and password.
    - Finalize to create tables and initial data.

### Upload only `file-uploader.php`, then use AppGini’s automatic uploader (recommended)
- In your AppGini project, set the Application URL (Project Properties > Security settings). Use full HTTPS URL to the app home, without index.php (for example, https://yourdomain.com/myapp).
- Manually upload only `file-uploader.php` (found in your generated app root) to the destination folder. After upload, it should be accessible at:
   - https://yourdomain.com/myapp/file-uploader.php
- Ensure your domain has a valid SSL certificate (HTTPS required).
- In AppGini, click Upload (visible after generating the app). Fix any checks that fail (uploader missing, not HTTPS, permissions).
- AppGini detects changed files and uploads only what’s needed.
- After upload, browse to your site URL and run the [setup wizard](./setup.md) using the database name/user/password you created above.

**Security tips for shared hosting**
- Keep `file-uploader.php` out of version control.
- If possible, restrict access to `file-uploader.php` by IP via `.htaccess` or hosting firewall/WAF.
- If the secret upload key is compromised: remove `file-uploader.php`, rotate the key in AppGini, regenerate the app, and re-upload the new file.

---

## Common issues with shared hosting

Shared hosting has various limitations that make it suitable only for small to medium apps, or for development/testing purposes. Common issues include:

- Limited resources: low CPU/memory can slow heavy operations.
- Strict file permissions: uploads may fail if folders aren’t writable by the web server.
- No root access: hard to tune PHP/Apache/Nginx, install system packages, or adjust WAF rules.
- WAF/mod_security may block the automatic uploader; you may need host support to whitelist `file-uploader.php`.
- Limited PHP/extension versions: ensure PHP 8+ and required extensions are available.
- Cron jobs, background tasks, and WebSockets may be restricted.
- Shared environment: noisy neighbors can affect performance and may even compromise security.

---

## Why we recommend VPS or cloud over shared hosting

On the other hand, VPS and cloud instances provide a much more robust and flexible environment for deploying AppGini applications, especially for production use. Benefits include:

- Full control of PHP versions, OPcache, PHP-FPM, extensions, and configuration.
- Dedicated resources and better scalability.
- Stronger security options (OS hardening, firewalling, isolation).
- Easier automation: CI/CD, Infrastructure as Code, Docker/Kubernetes, backups, monitoring.

It might be a little more complex to set up and manage, but the advantages often outweigh the initial effort, especially for business-critical applications.
We can provide you with [hands-on support and consulting for setting up and managing your VPS or cloud server](https://bigprof.com/appgini/consulting-service) if needed.

---

## Deploying to Windows Server (IIS)

Create the database first (local or managed).

- Local option: Install MySQL/MariaDB on your Windows Server; create a database and user with necessary privileges.
- Managed option: Use Amazon RDS, Azure Database for MySQL, or GCP Cloud SQL; note endpoint, DB name, user, password.

**Steps**

- Install/configure IIS with PHP 8+ (FastCGI) and enable mysqli, gd, iconv, json in `php.ini`.
- Create a site or application in IIS pointing to your app’s folder.
- Upload the generated app files (or upload `file-uploader.php` and use AppGini’s automatic uploader over HTTPS).
- Ensure the IIS app pool identity has write permissions where needed (uploads, temp, etc.).
- Browse to the app URL and [run the setup](./setup.md), using the DB credentials created earlier.

**Troubleshooting**

- Verify FastCGI mapping and PHP path.
- Confirm required PHP extensions are enabled.
- For the automatic uploader, ensure your PC has curl (available by default on most Windows installations), HTTPS is valid, and no antivirus/firewall is blocking requests.

---

## Deploying to VPS and cloud instances

**Create or connect a database before or during deployment.**

- Self-managed on the server (example with MySQL/MariaDB on Ubuntu):
    ```bash
    sudo mysql -e "CREATE DATABASE myapp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
    sudo mysql -e "CREATE USER 'myappuser'@'localhost' IDENTIFIED BY 'StrongPassword';"
    sudo mysql -e "GRANT ALL PRIVILEGES ON myapp.* TO 'myappuser'@'localhost'; FLUSH PRIVILEGES;"
	```
- Or managed database: RDS, Cloud SQL, Azure MySQL. Note endpoint, DB name, user, password, and any SSL requirements.

**General prerequisites**

- Linux distro (Ubuntu/Debian recommended).
- Apache or Nginx + PHP-FPM (PHP 8+ with mysqli, gd, iconv, json).
- Firewall/security groups allowing access to ports 80/443 to serve HTTP/HTTPS, and port 22 for SSH access.
- Valid SSL certificate (Let’s Encrypt or managed).

**Deployment workflow**

- Secure the server (sudo user, firewall, updates).
- Install the web stack and enable required PHP extensions.
- Create or connect to the database as above.
- Point DNS A record to the server IP and obtain SSL.
- Upload your app:
    - SFTP/SSH upload all files and run setup, or
    - Upload only `file-uploader.php`, then use AppGini’s Upload button.

If you need hands-on help, consider our [consulting service for VPS/cloud deployment and management](https://bigprof.com/appgini/consulting-service).

### VPS vs cloud instances

- VPS: Simpler and cheaper, fixed resources.
- Cloud: Rich ecosystem (managed DB, load balancers, monitoring), easier scaling, typically higher cost.

### Launching a cloud instance on Amazon AWS

Amazon Web Services (AWS) offers a wide range of cloud services, including EC2 for virtual servers and RDS for managed databases.
It is the most popular cloud provider and has a large ecosystem.

- Provision EC2 (for example, t3.small/t3.medium). Allow ports 22, 80, 443 in security group.
- Install Nginx/Apache + PHP 8+ with required extensions.
- Create MySQL locally or use Amazon RDS:
  - On RDS: create a MySQL instance, database, and user; allow the EC2 security group access.
- Route 53: point your domain to the EC2 public or Elastic IP. Set up SSL with certbot or use an AWS load balancer with ACM (managed certificate).
- Deploy files via SFTP/SSH or use the automatic uploader; run the setup with your DB credentials.

Need help? Check our [AWS deployment consulting service](https://bigprof.com/appgini/consulting-service).

### Launching a cloud instance on GCP

Google Cloud Platform (GCP) provides a variety of cloud services, including Compute Engine for virtual machines and Cloud SQL for managed databases.

- Create a Compute Engine VM (e2-medium); open firewall for HTTP/HTTPS/SSH.
- Install web stack and PHP extensions.
- Database options:
   - Local MySQL or GCP Cloud SQL (create DB and user; authorize VM’s IP or use private IP).
- Point Cloud DNS to the VM IP; set up SSL via certbot or use Google Cloud Load Balancer with managed certificate.
- Upload the app via SFTP/SSH or use the automatic uploader; run setup with DB details.

Need assistance? Check our [GCP deployment consulting service](https://bigprof.com/appgini/consulting-service).

### Launching a cloud instance on Azure

Azure (by Microsoft) offers a comprehensive set of cloud services, including Virtual Machines for compute and Azure Database for MySQL for managed databases.

- Create an Ubuntu VM (for example, B2s); open ports 22, 80, 443 in NSG (network security group).
- Install web stack and PHP extensions.
- Database options:
    - Local MySQL or Azure Database for MySQL (create DB and user; configure firewall rules/VNet).
- Point Azure DNS to the public IP (static recommended). Set up SSL via certbot or use Azure Front Door/Application Gateway with managed certificate.
- Deploy and run setup with DB info.

Need assistance? Check our [Azure deployment consulting service](https://bigprof.com/appgini/consulting-service).

### Launching a cloud instance on Hetzner

Hetzner offers a range of cloud services, including virtual servers and managed databases. They are known for their competitive pricing and reliable performance.

- Create a CX22/CX32 server. Open ports 22, 80, 443 in the firewall.
- Install web stack and PHP extensions.
- Database options:
  - Local MySQL/MariaDB or Hetzner Managed DB (create DB and user; allow server IP).
- Use Hetzner DNS; obtain SSL via certbot.
- Deploy and run setup.

For hands-on help, consider our [Hetzner deployment consulting service](https://bigprof.com/appgini/consulting-service).

### Launching a cloud instance on DigitalOcean

DigitalOcean provides a simple and cost-effective cloud platform, ideal for developers.

- Create a Droplet (2 GB RAM+ recommended).
- Install web stack and PHP extensions.
- Database options:
  - Local MySQL/MariaDB or DO Managed MySQL (create DB and user; allow Droplet IP; note CA if required).
- Point domain to Droplet IP; set up SSL with certbot or use DO Load Balancer with managed certificate.
- Deploy and run setup.

Check our [DigitalOcean deployment consulting service](https://bigprof.com/appgini/consulting-service) for assistance.

### Launching a cloud instance on Linode

Linode (now part of Akamai) offers reliable and affordable cloud computing services.

- Create a Linode (2 GB+). Open ports 22, 80, 443 in the firewall.
- Install web stack and PHP extensions.
- Database options:
  - Local MySQL/MariaDB or Linode Managed MySQL (if available in region).
- Configure DNS and SSL; deploy and run setup.

For help, see our [Linode deployment consulting service](https://bigprof.com/appgini/consulting-service).

### Buying VPS servers (most recommended providers)

- Value/performance: Hetzner, Contabo, OVHcloud, IONOS.
- Developer-focused: DigitalOcean, Linode (Akamai), Vultr.
- Cloud ecosystems: AWS, GCP, Azure (more expensive, richer services).
- For Docker, ensure at least 2 GB RAM.

---

## Deploying via Docker (docker compose)

Docker simplifies deployment by containerizing the app and its dependencies, making it portable and consistent across environments.

We provide a [ready-to-use Docker Compose setup for AppGini applications](https://github.com/bigprof-software/appgini-on-docker).

**What it provides**

- `docker-compose.yml`: App in Apache+PHP container, MySQL in a separate container, Let’s Encrypt companion for automatic SSL.
- `example.env` to configure domain and secrets.

**Prerequisites**

- Linux server with root access.
- Docker Engine + Docker Compose plugin.
- Domain pointing to server IP.
- At least 2 GB RAM.

**Steps**

- Access your server via SSH and run:
   ```bash
   git clone https://github.com/bigprof-software/appgini-on-docker.git ~/appgini-on-docker
   cd ~/appgini-on-docker
   cp example.env .env
   ```
- Edit `.env` to set your app domain, MySQL root password, and email for Let’s Encrypt:
    ```
    TOP_DOMAIN=myapp.example.com
    MYSQL_ROOT_PASSWORD=StrongRandomPassword
    LETSENCRYPT_EMAIL=you@example.com
    ```
- Prepare your app in the app directory:
    - Copy the generated app files (exclude `config.php` and `setup.md5`), or
    - Upload only `file-uploader.php`, then use AppGini’s automatic uploader.
- Start:
    ```bash
	cd ~/appgini-on-docker
    docker-compose up -d
    ```
- Access the app via https://myapp.example.com.
    - If only `file-uploader.php` exists, use the AppGini uploader to push files.
- Setup wizard database settings:
    - Host: `mysql`
    - User: `root`
    - Password: from `.env`
    - Port: `3306`
    - Then set the app admin account and finalize.

**Note on database creation with Docker**

- The compose stack brings up MySQL for you; you generally don’t pre-create a DB/user. AppGini setup will create and populate tables using the provided credentials. If you prefer a distinct DB and user, create them inside the DB container after it starts.

For more details, see the [AppGini on Docker GitHub repository](https://github.com/bigprof-software/appgini-on-docker).

If you need help, consider our [Docker deployment consulting service](https://bigprof.com/appgini/consulting-service).

---

## Using managed databases (Amazon RDS, Azure MySQL, GCP Cloud SQL, etc)

Managed database services handle database administration tasks (backups, patching, scaling), letting you focus on your application.
They might be more expensive than self-managed DBs but offer convenience and reliability, specially for critical production apps.

Create the database and user on the managed service.
- Provision a MySQL instance (RDS, Cloud SQL, Azure MySQL, DO/Hetzner Managed DB).
- Create a database and a dedicated user with a strong password; grant privileges on that DB.
- Configure network access:
    - Public: allow your server’s IP.
    - Private: place your app server in the same VPC/VNet (virtual private cloud, the recommended approach) or use a proxy/bastion.
- Obtain the endpoint/host, port (3306), DB name, user, password.
- Optional: enforce SSL; download the provider CA cert if PHP client validation is required and configure PHP/MySQL to use it.
- In the AppGini setup page, use these DB details to complete installation.


---

## Operational best practices

- **Backups**: Schedule database and app files; for managed DBs, confirm retention and PITR.
- **Updates**: Use the automatic uploader to push incremental changes.
- **Monitoring**: Enable server and DB monitoring; check logs and error reporting.
- **SSL**: Enforce HTTPS for both app access and the automatic uploader.
- **Permissions**: Keep write access minimal; ensure correct ownership (`www-data` or apache).
- **Staging**: Use a staging environment before production updates.
- **Security**: Regularly update PHP and dependencies; use strong passwords.


