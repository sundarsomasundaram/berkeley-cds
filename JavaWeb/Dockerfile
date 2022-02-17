FROM maven:3.6.1-jdk-8 as maven_builder
WORKDIR /cds/berkeley-cds/JavaWeb
ADD pom.xml .

FROM tomcat:8.5.43-jdk8
COPY --from=maven_builder /cds/berkeley-cds/JavaWeb/target/JavaWeb.war /usr/local/tomcat/webapps