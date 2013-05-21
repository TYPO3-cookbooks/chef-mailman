###### Exim configuration

#TODO presset exim4 configuration
package "exim4"
service "exim4"

template "/etc/exim4/conf.d/main/04_exim_config_mailman" do
  notifies :restart, resources(:service => "exim4")
end
template "/etc/exim4/conf.d/transport/40_exim_config_mailman"do
  notifies :restart, resources(:service => "exim4")
end
template "/etc/exim4/conf.d/router/101_exim_config_mailman"do
  notifies :restart, resources(:service => "exim4")
end
