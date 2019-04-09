FROM tomcat:9-jre8-alpine

ENV ERA_SRV_HOSTNAME $ERA_SRV_HOSTNAME

ADD https://download.eset.com/com/eset/apps/business/era/webconsole/latest/era.war /tmp/era.war

RUN mkdir /tmp/eraweb
RUN unzip -d /tmp/eraweb /tmp/era.war
RUN rm /tmp/era.war

RUN rm -rf /usr/local/tomcat/webapps/*

RUN mv /tmp/eraweb /usr/local/tomcat/webapps/era

ADD run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 8080 8009

CMD ["/bin/bash","/usr/local/bin/run.sh"]
