node.default['logstash']['agent']['version'] = '1.1.13'
node.default['logstash']['agent']['base_config_cookbook'] = 'logstash-rolebook'
node.default['logstash']['agent']['base_config'] = 'rax.agent.conf.erb'
node.default['logstash']['agent']['server_ipaddress'] = '127.0.0.1'
node.default['logstash']['agent']['xms'] = '100M'
node.default['logstash']['agent']['xmx'] = '300M'


include_recipe "apt"
include_recipe "chef-logstash::agent"

# check if running chef-solo.  If not, detect the logstash server/ip by role.  If I can't do that, fall back to using ['logstash']['agent']['server_ipaddress']
if Chef::Config[:solo]
  logstash_server_ip = node['logstash']['agent']['server_ipaddress']
else
  logstash_server_results = search(:node, "roles:#{node['logstash']['agent']['server_role']}")
  unless logstash_server_results.empty?
    logstash_server_ip = logstash_server_results[0]['ipaddress']
  else
    logstash_server_ip = node['logstash']['agent']['server_ipaddress']
  end
end

template "/etc/rsyslog.d/99-logstash.conf" do
	source "99-logstash.conf.erb"
	owner "root"
	group "root"
	mode 00644
	variables ({
		:logstash_server_ip => logstash_server_ip
	})
end

service "rsyslog" do
	supports :status => true, :restart => true
	action [ :restart ]
end
