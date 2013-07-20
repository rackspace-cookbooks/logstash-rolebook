node['logstash']['server']['enable_embedded_es'] = false
node['elasticsearch']['version'] = "0.20.6"


include_recipe "chef-logstash::server"
include_recipe "kibana::default"
