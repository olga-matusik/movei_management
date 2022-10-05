#!/bin/bash

#INSTAL GIT AND MYSQL
sudo apt-get update 
sudo apt-get install git mysql-client -y

#INSTALL DOCKER USING THE REPO - FOUND ALL IN INTERNET
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

 sudo mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker.io

#START DOCKER SERVICE
sudo service docker start 

#CLONE MOVIE APP REPO (with Docker file for the app inside)
#create uwsgi.ini and requirements.txt first

#BUILD APP DOCKER IMAGE
#RUN MYSQL CONTAINER
#DEPLOY OUR DATABASE INSIDE MYSQL CONTAINER
#RUN THE CONTAINER OF AN APP - FLASK APP