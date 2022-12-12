#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# A package resource named "apache2", with actions install
package 'apache2' do
  action :install
end

# A service resource named "apache2", with actions enable and then start (order matters)
service 'apache2' do
  action [ :enable, :start]
end

# A cookbook_file resource
cookbook_file '/var/www/html/index.html' do
  source 'regularindex.html'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
