# install_apache_OR_httpd
Process to install the Apache or the httpd on the Centos7 manually

Technical details for the installation of "httpd" on Centos7

        Package : httpd
        Port    : 80
        Protocal: http
--------------------------------------------------------------

        Server root     : /etc/httpd/     # This is a dir.
        Document root   : /var/www/html/  # This is a dir. , all webpages are stored here
        conf file       : /etc/httpd/conf/httpd.conf
        addon conf file : /etc/httpd/conf.d   # This is a dir.
        first page      : /var/www/html/index.html
        user/group      : apache/apache
        log dir         : /var/log/httpd/access_log
                          /var/log/httpd/error_log
---------------------------------------------------------------

Command for the installation

	#sudo yum -y install httpd
---------------------------------------------------------------

Command for services services

	# sudo systemctl status httpd.service		<----- Checking the status of the service
	# sudo systemctl start httpd.service		<----- Starting the service
	# sudo systemctl stop httpd.service			<----- Stoping the service
	# sudo systemctl enable httpd.service		<----- enabling the service (it works if the service is already started)
	# sudo systemctl disable httpd.service		<----- disabling the service (it works if the service is already enabled)
	# sudo systemctl restart httpd.service		<----- restarting the service
----------------------------------------------------------------

Additional commands to check if the service is running or not

	# ps -ef | grep httpd
	# netstat -ntpl | grap httpd
		(if netstat command is not working then please install "net-tools" using below command)
		(# sudo yum -y install net-tools)
		
	Note: if you are working on the VM than please ensure to check the firewall and the SELinux permission (it should be in the permissive mode).

	# sudo systemctl status firewalld.service		<----- Checking the status of firewall
	# sudo systemctl stop firewalld.service			<----- Stoping the firewall service
	# sudo getenforse								<----- if the result is "Enforcing" run the next command
	# sudo setenforce 0								<----- this will change the SELinux permission in the "Permissive" mode
--------------------------------------------------------------------

Change the default port no.

	-> All the configuration is stored in the "/etc/httpd/conf/httpd.conf"
	-> Stop the "httpd" service (sudo systemctl stop httpd.service)
	-> search for "Listen 80" and make the change in port no. (sudo sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf)
	-> restart the services (sudo systemctl restart httpd.service)
	
