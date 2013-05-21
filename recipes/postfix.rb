
if platform_family?('debian')
  package "debconf-utils"
  template "/var/tmp/debconf-postfix-selections" do
    variables( {
      :postfix => node["mailman"]["postfix"]
    } )
    owner "root"
    group "root"
    mode "0644"
  end
  execute "set-postfix-selections" do
    command "debconf-set-selections /var/tmp/debconf-postfix-selections"
  end
end

package "postfix"

