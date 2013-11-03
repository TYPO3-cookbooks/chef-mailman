######## Apache2 configuration

include_recipe "apache2"
#template "/etc/apache2/sites-enabled/#{node[:mailman][:domain]}.conf" do
#  owner "root"
#  group "root"
#  mode "644"
#end

web_app node[:mailman][:hostname] do
  template "apache/mailman.conf.erb"
#  ssl_certfile         ssl_certfile_path
#  ssl_keyfile          ssl_keyfile_path
#  ssl_cabundle_used    ::File::exist?(ssl_cabundle_path)
#  ssl_cabundle         ssl_cabundle_path
end
