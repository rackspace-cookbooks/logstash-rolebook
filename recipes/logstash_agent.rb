node.default['logstash']['agent']['version'] = '1.1.13'
node.default['logstash']['agent']['base_config_cookbook'] = 'logstash-rolebook'
node.default['logstash']['agent']['base_config'] = 'rax.agent.conf.erb'
node.default['logstash']['agent']['server_ipaddress'] = '127.0.0.1'
node.default['logstash']['agent']['xms'] = '100M'
node.default['logstash']['agent']['xmx'] = '300M'


include_recipe "apt"
include_recipe "chef-logstash::agent"
