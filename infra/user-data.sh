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
sudo apt-get install docker.io -y

#CLONE MOVIE APP REPO (with Docker file for the app inside)
#create uwsgi.ini and requirements.txt first
git clone https://github.com/olga-matusik/movei_management.git

#BUILD APP DOCKER IMAGE
cd ~/movei_management/flask 
sudo docker build -t movie-app .

#DEPLOY DATABASE INSIDE RDS DATABASE
mysql -h terraform-20221006145537473800000001.cpelnmirnwb7.eu-central-1.rds.amazonaws.com -u root -pmy-secret-pw < ~/movei_management/database/movies_db.sql

#RUN THE CONTAINER OF AN APP - FLASK APP
sudo docker run -d --name movie-db-mysql -p 80:80  --name=movie-app  -v ~/movei_management/flask/app:/app movie-app 