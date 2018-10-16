#updating libraries###
execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
end
 
 ###installing nginx###
package 'nginx' do
        action :install
end
 
 ###installing tomcat7###
package 'tomcat8' do
        action :install
end
 
###replacing nginx default vhost file by vhost file in our cookbook files/default directory###
#cookbook_file "/home/shankar/Desktop/chef/honda/cookbooks/sample_war_deployment/files/default" do
#  source "default"
#  mode "0644"
#  notifies :restart, "service[nginx]"
#end
 
###Clearing tomcat7 webapps ROOT folder###
#bash 'Clearing tomcat8 webapps ROOT folder' do
#  user 'root'
#  cwd '/home/ubuntu'
#  code <<-EOH
#  sudo rm -rf /var/lib/tomcat8/webapps/ROOT
#  EOH
#end
 
###copying and replacing existing ROOT.war with new ROOT.war in our cookbook files/default directory###
cookbook_file "/var/lib/tomcat8/webapps/ola.war" do
  source "ola.war"
  mode "0644"
#  notifies :restart, "service[nginx]"
#  notifies :restart, "service[tomcat8]"
end
 
###restarting tomcat7 service###
#service 'tomcat8' do
#  supports :restart => true
#end
execute :"tomcat8 start" do
  command "service tomcat8 start"
end
 
###restarting nginx web server###
#service 'nginx' do
#  supports :restart => true
#  supports :reload =>true
#end
execute :"nginx start" do
  command "service nginx start"
end
