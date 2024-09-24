FROM tomcat:9-jdk17-openjdk-bullseye

ENV ERA_SRV_HOSTNAME $ERA_SRV_HOSTNAME

ADD https://download.eset.com/com/eset/apps/business/era/webconsole/v11/11.1.149.0/era.war /tmp/era.war

RUN mkdir /tmp/eraweb
RUN unzip -d /tmp/eraweb /tmp/era.war
RUN rm /tmp/era.war

RUN rm -rf /usr/local/tomcat/webapps/*

RUN mv /tmp/eraweb /usr/local/tomcat/webapps/era

ADD run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 8080 8009

CMD ["/bin/bash","/usr/local/bin/run.sh"]
