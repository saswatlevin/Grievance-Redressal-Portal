#!/bin/bash

# Update all repositories
sudo apt update

# =========INSTALL NODEJS========= #
echo "Installing cURL"
sudo apt install curl

echo "Adding the NodeJS 22 Reporsitory"
curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh

echo "Installing NodeJS"
sudo apt install nodejs

echo "Checking the NodeJS Version"
node -v

echo "Checking the NPM Version"
npm -v

# To compile native addons from npm packages, install the build tools
echo "Installing the Build Tools"
sudo apt install build-essential

# =========INSTALL NESTJS========= #
echo "# =========INSTALLING NESTJS========= #"
sudo npm install -g @nestjs/cli

echo "Checking the NestJS Version"
nest -v

# =========INSTALL POSTGRESQL========= #
echo "Installing CA Certificates"
sudo apt install ca-certificates

echo "Installing the PostgreSQL Global Development Group"
sudo install -d /usr/share/postgresql-common/pgdg

echo "Immporting the PostgreSQL Signing Key"
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc

echo "Adding the Official PostgreSQL Repository to APT"
echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list > /dev/null


echo "Updating all APT Repositories"
sudo apt update

echo "Installing PostgreSQL 17"
sudo apt install postgresq-18

echo "Installing PostgreSQL Client 17"
sudo apt install postgresql-client-18

echo "Verifying Postgres Version"
psql --version

echo "Checking if Postgres Service is Running"
sudo systemctl status postgresql

echo "Enabling Postgres"
sudo systemctl enable postgresql

echo "Starting Postgres"
sudo systemctl start postgresql

# =========CONFIGURE POSTGRESQL========= #
# Connect to Postgres w/o a Password
sudo -u postgres psql
# Set the Postges Admin Password to demoPassword
ALTER USER postgres PASSWORD 'demoPassword';
# Command to Create a Database
CREATE DATABASE my_database;
# Connect to "my_database"
\connect my_database
# See all tables in "my_database"
\dt *.*
# See all tables in the "public" schema
\dt public.*
# Quit
\q
# Reconnect to Postgres to see if the Password has been set
psql -h localhost -U postgres

# =========CONFIGURE POSTGRES TO ACCEPT REMOTE CONNECTION========== #
# PostgreSQL reads its configuration from the postgresql.conf file which is located in the /etc/postgresql/<version>/main/ directory
sudo vi /etc/postgresql/17/main/postgresql.conf

# Now, open the postgresql.conf file in a text editor, uncomment the line that starts with the listen_addresses, and replace ‘localhost’ with ‘*’.
# This setting is located under the CONNECTIONS AND AUTHENTICATION section
# Set the listen_addresses = "*"

# Check postgres logs
sudo tail -f /var/log/postgresql/postgresql-17-main.log
