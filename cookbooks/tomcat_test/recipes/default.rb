#
# Cookbook Name:: tomcat_test
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#tomcaturl = "http://apache.claz.org/tomcat/tomcat-7/v7.0.59/bin/apache-tomcat-7.0.59.tar.gz"
tcuser = node['tomcat_test']['user']
tcgroup = node['tomcat_test']['group']
version = node['tomcat_test']['version']
tcurl = "https://archive.apache.org/dist/tomcat/tomcat-7/v#{version}/bin/apache-tomcat-#{version}.tar.gz"
tomcat_path = "/opt/apps/tomcat#{version}"
software_dir = node['tomcat_test']['software_dir']

#create user
user tcuser do 
	action :create
	home "/home/#{tcuser}"
	shell "/bin/bash"
	not_if "grep #{tcuser} /etc/passwd"
end
#create group
group tcgroup do
	action :create
	not_if "grep #{tcgroup} /etc/group"
end

create_dirs = node['tomcat_test']['dirs']

 create_dirs.each do |path|
	directory path do
		owner "#{tcuser}"
		group "#{tcgroup}"
		recursive true
		mode "0755"
		action :create
	end
end

remote_file "#{software_dir}/tomcat.tar.gz" do
	source "#{tcurl}"
	owner "#{tcuser}"
	group "#{tcgroup}"
	mode "0644"
	action :create
	not_if {File.exists? ("#{software_dir}/tomcat.tar.gz")}
end

execute "untar" do
	user "#{tcuser}"
	group "#{tcgroup}"
	cwd software_dir
	command "tar -xzf *.tar.gz -C #{tomcat_path}"
	action :run
	not_if {File.exists? ("#{tomcat_path}/apache-tomcat-#{version}")}
end











