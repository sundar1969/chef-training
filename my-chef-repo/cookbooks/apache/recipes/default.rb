#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, SundarTraining Inc.
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
  action :install
end

# Disable the default virtual host
execute "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.disabled" do
  only_if do
    File.exist?("/etc/httpd/conf.d/welcome.conf")
  end
  notifies :restart, "service[httpd]"
end

# Iterate over the apache sites
node["apache"]["sites"].each do |site_name, site_data|
## ---> ********** LOOP BEGIN ********** <----
# Set the document root
  document_root = "/srv/apache/#{site_name}"

# Add a template for Apache virtual host configuration
  template "/etc/httpd/conf.d/#{site_name}.conf" do
    source "custom.erb"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => site_data["port"]
    )
    notifies :restart, "service[httpd]"
  end

# Add a directory resource to create the document_root
  directory document_root do
    mode "0755"
    recursive true
  end

# Add a template resource for the virtual host's index.html
  template "#{document_root}/index.html" do
    source "index.html.erb"
    mode "0644"
    variables(
      :site_name => site_name,
      :port => site_data["port"]
    )
  end
## ---> ********** LOOP END ********** <----
end

#   Remember to make the service block for restart as the last step. Otherwise service will start before conf files are generated.
service "httpd" do
  action [ :enable, :start ]
end

# This is for the lab where we proved precedence order. Recipe trumps everything else.
#node.default["apache"]["indexfile"] = "index2.html"
#cookbook_file "/var/www/html/index.html" do
# source node["apache"]["indexfile"]
# mode "0644"
#end
