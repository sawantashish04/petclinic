FROM java:8-jre

RUN apt-get update && apt-get install wget 
RUN wget http://mirrors.wuchna.com/apachemirror/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz
RUN tar -xvf apache-tomcat-8.5.35.tar.gz && mv apache-tomcat-8.5.35 /opt/tomcat/

ENV catalina_home /opt/tomcat
ENV PATH=/opt/tomcat/bin:$PATH
ADD ./petclinic.war $catalina_home/webapps/

EXPOSE 8080

CMD ["catalina.sh","run"]
