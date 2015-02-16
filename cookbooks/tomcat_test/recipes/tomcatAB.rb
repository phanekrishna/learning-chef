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
create_dirs = node['tomcat_test']['dirs']
tcurl = "https://archive.apache.org/dist/tomcat/tomcat-7/v#{version}/bin/apache-tomcat-#{version}.tar.gz"
tomcat_path = "/opt/apps/tomcat#{version}"
tomcat_base = "/opt/apps/tomcat#{version}"
software_dir = node['tomcat_test']['software_dir']
#sides = node['tomcat_test']['sides']
#instances = node['tomcat_test']['instances']
tomcat_main = "/opt/apps/tomcat"

#creates user
user tcuser do 
	action :create
	home "/home/#{tcuser}"
	shell "/bin/bash"
	not_if "grep #{tcuser} /etc/passwd"
end

#creates group
group tcgroup do
	action :create
	not_if "grep #{tcgroup} /etc/group"
end
#creates A and B sides
for sides in ['A' , 'B'] do 
	for instance in [1, 2, 3, 4] do
		directory "#{tomcat_main}/#{sides}/tomcat#{sides}-#{instance}" do
			owner "#{tcuser}"
			group "#{tcgroup}"
			recursive true
			mode "0755"
			action :create
			not_if {Dir.exists? ("#{tomcat_main}/#{sides}/tomcat#{sides}-#{instance}")}
		end
#		remote_file "#{tomcat_main}/#{sides}/tomcat#{sides}-#{instance}.tar.gz" do
		remote_file "/tmp/tomcat#{version}.tar.gz" do

			source "#{tcurl}"
			owner "#{tcuser}"
			group "#{tcgroup}"
			mode "0644"
			action :create
			not_if {File.exists? ("#{tomcat_main}/#{sides}/tomcat#{sides}-#{instance}.tar.gz")}
		end
		execute "untar" do
			user "#{tcuser}"
			group "#{tcgroup}"
			cwd "/tmp"
			command "tar -xzf tomcat#{version}.zip -C #{tomcat_main}/#{sides}/tomcat#{sides}-#{instance}"
			action :run
			not_if {File.exists? ("tomcat#{sides}-#{instance}")}
		end
	end	
end	







