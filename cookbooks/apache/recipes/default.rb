#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

include_recipe 'hello_world'

# A package resource named "apache2", with actions install
package 'apache2' do
  action :install
end

# A service resource named "apache2", with actions enable and then start (order matters)
service 'apache2' do
  action [ :enable, :start]
end

# A cookbook_file resource
template '/var/www/html/index.html' do
  source node['apache']['indexfile']
  mode '0644'
  action :create
end
