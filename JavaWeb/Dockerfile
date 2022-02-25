FROM maven:3.6.1-jdk-8 as maven_builder
WORKDIR /cds/berkeley-cds/JavaWeb
#ADD pom.xml .
#RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "package", "--fail-never"]

COPY . .
RUN mvn -f pom.xml clean compile package
#RUN mvn clean compile package 
RUN ls -lart /cds/berkeley-cds/JavaWeb/target

FROM tomcat:8.5.43-jdk8
#RUN rm -rf /usr/local/tomcat/webapps/*
#COPY --from=maven_builder /cds/berkeley-cds/JavaWeb/target/* /usr/local/tomcat/webapps/
COPY --from=maven_builder /cds/berkeley-cds/JavaWeb/target/*.war /usr/local/tomcat/webapps/webapp.war
#COPY /target/*.war /usr/local/tomcat/webapps/webapp.war
