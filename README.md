# 🐚 Shell Scripting & Automation

This folder contains my automation scripts. My main project here is the automated deployment of a web application.

## 📜 `deploy-notes-app.sh`

This is a Bash shell script that automates the entire deployment process of a Django Notes Application on a fresh AWS EC2 Ubuntu instance. 

### ✨ What it automates:
* **System Readiness:** Updates the Ubuntu OS package repository.
* **Dependency Installation:** Automatically installs `docker.io` and `docker-compose` so you don't have to install them manually.
* **User Management:** Adds the current user to the Docker group to avoid running commands with `sudo` every time.
* **Code Fetching:** Clones the web application source code directly into the server (`/var/www/`).
* **Infrastructure Launch:** Triggers Docker-Compose to build and launch the Django backend, MySQL database, and Nginx reverse proxy containers in one go.

### 🚀 How to run it:
```bash
chmod +x deploy-notes-app.sh
./deploy-notes-app.sh
