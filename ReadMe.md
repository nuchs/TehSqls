# Db in a container

## Installing sqlcmd

`$ curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -`

`$ curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list`

`$ sudo apt-get update`

`$ sudo apt-get install mssql-tools unixodbc-dev`

`sqlcmd` will be installed to `/opt/msql-tools/bin/sqlcmd`, you may want to add that to the path

## Create database

Start container with

`$ docker-compose up -d`

Run the script to create an initial db

`$ sqlcmd -S localhost,1433 -U SA -P "A_Bad_Password" -i Scripts/Initial.sql`

Check it completed correctly

`$ sqlcmd -S localhost,1433 -U SA -P "A_Bad_Password" -d TestDb -Q 'EXEC Report'`

To make sure that persistance is working restart the stack

`$ docker-compose down`

`$ docker-compose up -d`

`$ sqlcmd -S localhost,1433 -U SA -P "A_Bad_Password" -d TestDb -Q 'EXEC Report'`

## Secure Container

Run in the secure script, this will change the password for the SA users and create two database users; a service user which can interact with the data and a update user which is used to manage the schema.

`$ sqlcmd -S localhost,1433 -U SA -P "A_Bad_Password" -i Scripts/Secure.sql`

## Todo
* TLS
* Patching schema
* Encryption
* Audit
