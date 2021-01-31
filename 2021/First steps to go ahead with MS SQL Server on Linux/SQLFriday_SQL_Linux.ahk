;========================================================================================================================================================================
;To define a new repository, you can either add a [repository] section to the /etc/yum.conf file, or to a .repo file in the /etc/yum.repos.d/ directory. All files with the .repo ;file extension in this directory are read by yum, and it is recommended to define your repositories here instead of in /etc/yum.conf. */
;========================================================================================================================================================================

::r1::
Send yum repolist all
return

;========================================================================================================================================================================
;In case that the repository is disable we could enable it with the following command: yum-config-manager --enable  repo_id(get it from repolist all), it will return a 
;permission message, so it is important to hightligh about sudo and explain about root. */
;========================================================================================================================================================================

::r2::
MsgBox *****  See the denied permission when we try to execute the following command *******
Send yum-config-manager --enable write_repo_id_here
return

;========================================================================================================================================================================
;For disabling you only need to apply the following command
;========================================================================================================================================================================

::r3::
Send sudo yum-config-manager --disable write_repo_id_here
return

::r4::
MsgBox *****  In Ubuntu we can use the following command  *******
Send ls /etc/apt/sources.list.d
return

;========================================================================================================================================================================
;CURL command
;========================================================================================================================================================================

;curl is a software for transfering files, the parameter -o especify the file name
;so the following command save the download file into the path/name: /etc/yum.repos.d/mssql-server.repo
;the symbol > allow us to create a new file(or overwrite an existing) and >> append the content in an existing without replacing the content

::c1::
Send sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/8/mssql-server-2019.repo
return   
 
::c2::
Send curl https://packages.microsoft.com/config/rhel/8/mssql-server-2019.repo | sudo tee /etc/yum.repos.d/mssql-server.repo 
return 

::c3::
MsgBox *****  Another option which we must to implement a sudo su, the next option will fail *******
Send sudo curl https://packages.microsoft.com/config/rhel/8/mssql-server-2019.repo > /etc/yum.repos.d/mssql-server.repo
return 

;========================================================================================================================================================================
;Installing the repo packages - 
;   1. Red Hat Enterprise Level
;   2. Ubuntu
;========================================================================================================================================================================

;========================================================================================================================================================================
; 1. RHEL - Installing & Configuring SQL Server, the parameter -y is to answer yes to everything
;========================================================================================================================================================================

::rh1::
Send sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/8/mssql-server-2019.repo
return   

::rh2::
Send sudo yum install -y mssql-server
return 

::rh3::
Send yum remove mssql-server
return 

::rh4::
MsgBox *****  Starting with the Setup  *******
Send sudo /opt/mssql/bin/mssql-conf setup
return

::rh5::
MsgBox *****  Options to check our new SQL Server service  *******
Send ps -ef | grep sql
return 

::rh6::
Send systemctl status mssql-server
return 

::rh7::
MsgBox *****  Downloading the SQL Server Client Tools - Repo for RHEL: https://packages.microsoft.com/config/rhel/8/ *******
Send curl https://packages.microsoft.com/config/rhel/8/prod.repo | sudo tee /etc/yum.repos.d/msprod.repo
return 

;======================================================================================================================
; As alternative option we have:
;sudo curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/8/prod.repo
;======================================================================================================================

::rh8::
MsgBox *****  Installing the SQL Server Tools - Repo for RHEL: https://packages.microsoft.com/config/rhel/8/ *******
Send sudo yum install mssql-tools unixODBC-devel
return 

::rh9::
MsgBox *****  Try to connect locally : SELECT @@VERSION GO *******
Send sudo /opt/mssql-tools/bin/sqlcmd -U sa
return 

::rh10::
MsgBox *****  Finally, ONLY for RHEL open port 1433 on the firewall *******
Send sudo firewall-cmd --zone=public --add-port=1433/tcp --permanent && sudo firewall-cmd --reload
return 


;======================================================================================================================
; 1. Ubuntu - Installing SQL Server
;======================================================================================================================
::ub1::
MsgBox *****  apt-key is a utility to add trusted keys to apt for repositories   *******
Send curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
return

;======================================================================================================================
;Storing the package
;======================================================================================================================
::ub2::
Send curl https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list | sudo tee /etc/apt/sources.list.d/mssql-server.list
return

;======================================================================================================================
;Setting up ms sql 
;======================================================================================================================
::ub3::
Send sudo apt-get update && sudo apt-get install -y mssql-server
return

::ub4::
MsgBox *****  Starting with the Setup on Ubuntu *******
Send sudo /opt/mssql/bin/mssql-conf setup
return

;======================================================================================================================
;Checking the service status
;======================================================================================================================
::ub5::
Send sudo systemctl status mssql-server
return 


;======================================================================================================================
;Downloading the SQL Server Client tools 
;======================================================================================================================
::ub6::
Send curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list 
return

;======================================================================================================================
; Other examples
;Send sudo curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > sudo /etc/apt/sources.list.d/msprod.list
;curl -o /etc/apt/sources.list.d/msprod.list https://packages.microsoft.com/config/ubuntu/18.04/prod.list
;======================================================================================================================

;======================================================================================================================
;Installing the SQL Server Client tools 
;======================================================================================================================

::ub7::
Send sudo apt-get update && sudo apt-get install mssql-tools unixodbc-dev
return


::ub8::
MsgBox *****  Try to connect locally : SELECT @@VERSION GO *******
Send sudo /opt/mssql-tools/bin/sqlcmd -U sa
return 

::d5::
Send explain select emp_no,last_name,first_name from employees as e where e.emp_no = 10004 \G
return

::d6::
Clipboard = 
(
	select emp_no,last_name,first_name from employees as e
	inner join salaries as s on e.emp_no=s.emp_no
	where e.emp_no = 10004 \G;     

)
send ^v
return