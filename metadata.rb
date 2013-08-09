name             'logstash-rolebook'
maintainer       'Ryan Richard'
maintainer_email 'ryan.richard@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures logstash-rolebook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

#chef-logstash handles most dependencies
depends 'apt'
depends 'logstash'
depends 'chef-logstash'
depends 'elasticsearch'
depends 'kibana'