default["mailman"]["mailman_email"] = "mailman@#{node['domain']}"
default["mailman"]["mailman_password"] = nil
default['mailman']['domain']="lists.#{node['domain']}"
default['mailman']['mta'] = 'postfix'


default["mailman"]["list_creator"] = nil
default["mailman"]["site_pass"] = nil

default["mailman"]["home"] = "/var/lib/mailman"
default["mailman"]["user"] = "list"
default["mailman"]["group"] = "list"
