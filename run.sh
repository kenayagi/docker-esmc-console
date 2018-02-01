#!/bin/bash

sed -i 's/^server_address=.*/server_address='"$ERA_SRV_HOSTNAME"'/g' /usr/local/tomcat/webapps/era/WEB-INF/classes/sk/eset/era/g2webconsole/server/modules/config/EraWebServerConfig.properties

/usr/local/tomcat/bin/catalina.sh run
