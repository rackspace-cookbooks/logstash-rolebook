node.default['logstash']['server']['version'] = '1.1.13'
node.default['logstash']['server']['enable_embedded_es'] = false
node.default['kibana']['elasticsearch']['port'] = '9200'
node.default['logstash']['server']['base_config'] = "rax.server.conf.erb"
node.default['logstash']['server']['base_config_cookbook'] = "logstash-rolebook"
node.default['logstash']['server']['install_rabbitmq'] = false

es_server_results = search(:node, "roles:#{node.default['logstash']['elasticsearch_role']}")
node.default['kibana']['elasticsearch']['hosts'] = [es_server_results[0]['ipaddress']]

include_recipe "apt"

include_recipe "chef-logstash::server"
include_recipe "kibana::default"
include_recipe "kibana::apache"
