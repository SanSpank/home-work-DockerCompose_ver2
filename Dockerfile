FROM maven:3.6.1-jdk-8-slim as maven_builder
WORKDIR /app
COPY . /app
RUN mvn clean package


FROM tomcat:9-alpine
COPY --from=maven_builder /app/target/hello-1.0.war /usr/local/tomcat/webapps
