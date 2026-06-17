#!/bin/bash

#set -e is used to handle errors

set -e

#deploying a django app and handle errors
#Configuration Variables

repo_url="https://github.com/ajitsinghnegi/django-notes-app.git"
app_dir="/var/www/django-notes-app"

#updating system and installing system tools and dependencies

install_tools(){

                echo "INSTALLING TOOLS STARTED"

                sudo apt-get update -y && sudo apt-get upgrade -y

                sudo apt-get install -y nginx docker.io docker-compose docker-buildx

                echo "INSTALLS AND UPDATES ARE COMPLETED" || { echo "failed to install tools."

                exit 1

                        }

                }
echo "INSTALLATION FINISHED"

#cloning the django app code

clone(){
                echo "APP CLONING STARTS"

                if [ -d "$app_dir" ]; then

                echo "code already exists at "$app_dir" pulling the latest changes."

                cd "$app_dir"

                git pull origin main || { echo "failed to pull code"

                exit 1

                        }

                else

                        git clone "$repo_url" "$app_dir" || { echo "cloning failed."

                        exit 1

                        }

          fi
            }
echo "APP CLONING FINISHED"

#doing restart and enabling the tools

required_restart(){

                        echo "RESTARTING THE SYSTEM"

                        systemctl enable nginx

                        systemctl enable docker

                        systemctl restart docker

echo "RESTARTING FINISHED"

deploy(){

                docker build -t notes-app .

                docker run -d -p 8000:8000 notes-app:latest

        }

echo "DEPLOYMENT STARTED"

install_tools
clone
required_restart
deploy

echo "DEPLOYMENT FINISHED"
