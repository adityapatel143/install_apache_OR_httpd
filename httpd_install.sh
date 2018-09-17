#!/bin/bash

##############################################
#Purpos : To install and configure the "httpd" using script
#Version: 1.0
#Owner	: Aditya P <adityapatel@mycompany.com>
#Input	: None
#Output	: None
#Dependency: This file is dependent on master_fun_file
###############################################

#calling the function file
. master_fun_file

#===================== main proggram ===========================#

#calling the function to check root
root_or_not

#stoping the firewall
SERVICE_NAME=firewalld
stop_service

#desibling the firewall
#disable_firewall # calling the function
SERVICE_NAME=firewalld
disable_service

# changing the server security
change_to_permissive

#check if "httpd" package is installed or not
PACKAGE_NAME=httpd
check_install_package

#check if "net-tools" package is installed or not
PACKAGE_NAME=net-tools
check_install_package

#checking if service is running properly or not
SERVICE_NAME=httpd
start_service

# enabling the httdp service
SERVICE_NAME=httpd
enable_service

#finding the port for "httpd"
SHOW_PORT=httpd
find_port_no

echo -e "\n\t* * * Configuration completed for "httpd" service * * *\n"
