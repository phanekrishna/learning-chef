#default['httpd']['dir'] = '/etc/httpd_test'
#default['tomcat_test']['source_url'] = "https://archive.apache.org/dist/tomcat/tomcat-7/v"
default['tomcat_test']['version'] = "7.0.27"

default['tomcat_test']['dirs'] = ["/opt/apps/", "/opt/apps/test1", "/opt/apps/test2", 
	"/opt/apps/tomcat#{node['tomcat_test']['version']}"]

default['tomcat_test']['user'] = "tomcat"
default['tomcat_test']['group'] = "tomcat"




#https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.27/
#apache-tomcat-7.0.27.tar.gz
