node.default['elasticsearch']['discovery']['zen']['ping']['multicast']['enabled'] = false
node.default['elasticsearch']['version'] = "0.90.1"

include_recipe "apt"
include_recipe "java"
include_recipe "elasticsearch"