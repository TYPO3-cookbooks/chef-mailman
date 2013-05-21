######## Apache2 configuration

include_recipe "apache2"
template "/etc/apache2/sites-enabled/mailman.conf" do
  owner "root"
  group "root"
  mode "644"
end

apache_site "mailman.conf"

#apache_site "default" do
# enable false
#end

