
if platform_family?('debian')
  package "debconf-utils"
  template "/var/tmp/debconf-postfix-selections" do
    variables( {
      :postfix => node["mailman"]["postfix"]
    } )
    owner "root"
    group "root"
    mode "0644"
    source "postfix/debconf-postfix-selections.erb"
  end
  execute "set-postfix-selections" do
    command "debconf-set-selections /var/tmp/debconf-postfix-selections"
  end
end

include_recipe "postfix"

# override the main.cf and master.cf template of the postfix cookbook
%w{main master}.each do |cfg|
  master_cf_resource = resources("template[/etc/postfix/#{cfg}.cf]")
  master_cf_resource.cookbook "mailman"
  master_cf_resource.source "postfix/#{cfg}.cf.erb"
end

template "/usr/lib/mailman/bin/postfix-to-mailman.py" do
  source "mailman/postfix-to-mailman.py.erb"
  mode 0755
end