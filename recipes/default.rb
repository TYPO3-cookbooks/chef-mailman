#
# Cookbook Name:: mailman
# Recipe:: default
#
# Copyright 2013, computerlyrik
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)

#TODO: set preseed for language options
package "mailman"

service "mailman" do
  action [:enable, :start]
end

directory "/etc/mailman/aliases"
template "/etc/aliases"

execute "newaliases" do
  action :nothing
  subscribes :run, resources(:template => "/etc/aliases")
end

node.set_unless[:mailman][:mailman_password] = secure_password

template "/etc/mailman/mm_cfg.py" do
  source "mailman/mm_cfg.py.erb"
  variables(
    :config => node[:mailman][:config]
  )
  notifies :restart, resources(:service => "mailman")
end

if not node[:mailman][:site_pass].nil?
  execute "site_pass" do
    command "mmsitepass #{node[:mailman][:site_pass]}"
  end
end
if not node[:mailman][:list_creator].nil?
  execute "list_creator" do
    command "mmsitepass -c #{node[:mailman][:list_creator]}"
  end
end

include_recipe "mailman::apache"

if node[:mailman][:mta] == "postfix"
  include_recipe "postfix"
end

include_recipe "mailman::lists"
