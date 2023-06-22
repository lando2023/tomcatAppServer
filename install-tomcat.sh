#!/bin/bash
# TOMCAT.SH
# Steps for installing tomcat9 on rhel7&8
# install Java JDK 1.8+ as a prerequisite for tomcat to run
# https://github.com/lando2023/package-management/tree/main

sudo hostnamectl set-hostname tomcat
cd /opt
yum install git vim wget
sudo yum install java-1.8.0-openjdk-devel

# Download tomcat software and extract it
# download and extract tomcat software

sudo tar -xvf apache-tomcat-9.0.76.tar.gz
sudo mv apache-tomcat-9.0.76 tomcat9
sudo rm apache-tomcat-9.0.76.tar.gz
sudo chmod 777 -R /opt/tomcat9
sh /opt/tomcat9/bin/startup.sh

# Create a soft link to start and stop tomcat from anywhere
# to manage tomcat as a service

sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat
sudo su - ec2-user 
echo “end on tomcat installation”
#======================

