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