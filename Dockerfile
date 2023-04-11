FROM ubuntu
#jdk install
RUN apt-get update && apt-get install openjdk-17-jdk -y
RUN java --version
# apache install
RUN apt-get update && apt-get install apache2 -y
# tomcat install
RUN apt-get install wget -y
WORKDIR  /opt
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.7/bin/apache-tomcat-10.1.7.tar.gz && \
    tar -xvzf /opt/apache-tomcat-10.1.7.tar.gz && mv apache-tomcat-10.1.7 tomcat && \
    chmod 777 /opt/tomcat/bin/*.sh
COPY webapp.war  /opt/tomcat/webapps 
CMD ["service apache2 start"]
CMD ["catalina.sh", "run"]
EXPOSE 80 
EXPOSE 8080






