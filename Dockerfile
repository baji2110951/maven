FROM nginx

MAINTAINER Baji

RUN apt-get update
RUN apt-get install -y default-jdk
RUN apt-get install -y openssh-server

RUN mkdir opt/tomcat/

WORKDIR /opt/tomcat

RUN mkdir application

ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz .

RUN tar -xvzf apache-tomcat-8.5.82.tar.gz

RUN mv apache-tomcat-8.5.82/* /opt/tomcat

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh","run"]
