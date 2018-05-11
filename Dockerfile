FROM registry.isspaas.com/tutum/tomcat:latest
#FROM 10.24.17.205:5000/deis_apps/tomcat:8.0

RUN rm -rf /tomcat/webapps/*
ADD target/HelloSpringBoot.war /tomcat/webapps/
RUN mv /tomcat/webapps/HelloSpringBoot.war /tomcat/webapps/ROOT.war

# docker build -t 10.24.17.205:5000/deis_apps/spring-music:1.0 .
# docker run --name spring-music --rm -it -p 8080:8080 10.24.17.205:5000/deis_apps/spring-music:1.0

# deis create
# deis pull 10.24.17.205:5000/deis_apps/tomcat:8.0