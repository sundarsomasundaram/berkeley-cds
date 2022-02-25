FROM maven:3.6.1-jdk-8 as maven_builder
WORKDIR /cds/berkeley-cds/JavaWeb
ADD pom.xml .
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "package", "--fail-never"]
RUN mvn package

FROM tomcat:8.5.43-jdk8
COPY /cds/berkeley-cds/JavaWeb/target/JavaWeb-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/JavaWeb.war