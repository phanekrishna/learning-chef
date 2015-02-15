#
# Cookbook Name:: tomcat_test
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#tomcaturl = "http://apache.claz.org/tomcat/tomcat-7/v7.0.59/bin/apache-tomcat-7.0.59.tar.gz"
tcuser = "tomcat"
tcgroup = "tomcat"

user tcuser do 
	action :create
	home "/home/#{tcuser}"
	shell "/bin/bash"
	not_if "grep #{tcuser} /etc/passwd"
end

group tcgroup do
	action :create
	not_if "grep #{tcgroup} /etc/group"
end
