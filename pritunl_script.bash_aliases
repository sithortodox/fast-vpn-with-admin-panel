#!/bin/bash
sudo su
sudo apt update && apt upgrade -y
sudo apt install curl gnupg2 wget unzip -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv E162F504A20CDF15827F718D4B7C549A058F8B6B
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
echo "deb http://repo.pritunl.com/stable/apt focal main" | sudo tee /etc/apt/sources.list.d/pritunl.list
sudo apt update
sudo apt install pritunl -y
sudo systemctl stop pritunl
sudo systemctl start pritunl
sudo systemctl enable pritunl
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt update
sudo apt-get install mongodb-server -y
echo "Open in your browser https://your-ip/"
sudo pritunl setup-key
echo "Enter this code in the installation form"
echo "Follow the instructions in the browser"