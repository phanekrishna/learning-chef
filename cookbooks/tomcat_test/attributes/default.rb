#default['tomcat_test']['source_url'] = "https://archive.apache.org/dist/tomcat/tomcat-7/v"
#https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.27/
#apache-tomcat-7.0.27.tar.gz

default['tomcat_test']['version'] = "7.0.27"

default['tomcat_test']['dirs'] = ["/opt/apps/", 
	"/opt/apps/test1", 
	"/opt/apps/test2", 
	"/opt/apps/tomcat#{node['tomcat_test']['version']}",
	"/opt/apps/software"]

default['tomcat_test']['user'] = "tomcat"
default['tomcat_test']['group'] = "tomcat"

default['tomcat_test']['software_dir'] = "/opt/apps/software"

default['tomcat_test']['sides'] = ["A", "B"]
default['tomcat_test']['instances'] = [1, 2, 3, 4]



