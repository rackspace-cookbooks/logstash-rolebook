logstash-rolebook Cookbook
==========================
TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwhich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### supporting cookbooks
- `elasticsearch` - logstash-rolebook needs an elasticsearch node to point too
- `kibana` - web frontend for searching logs
- `logstash` - to do the shipping/indexes heavy lifting 



Usage
-----

#### Roles:
You'll want to create two roles that reference the recipes in this cookbook:
-   `elasticsearch_server` which includes recipe[logstash-rolebook::elasticsearch_server]
-   `logstash_server` which includes recipe[logstash-rolebook::logstash_server]

#### Agents:
Logstash agents can be added by including the `logstash-rolebook::logstash_agent` recipe

#### logstash-rolebook::default
Default recipe doesn't do anything


License and Authors
-------------------
Authors: Ryan Richard
