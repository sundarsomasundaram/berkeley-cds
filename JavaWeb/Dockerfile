FROM maven:3.6.1-jdk-8 as maven_builder
WORKDIR /cds/berkeley-cds/JavaWeb
ADD pom.xml .
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]

FROM tomcat:8.5.43-jdk8
COPY /target/JavaWeb.war /usr/local/tomcat/webapps/JavaWeb.war