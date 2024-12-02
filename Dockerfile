FROM eclipse-temurin:21-jdk

WORKDIR /app

RUN apt-get update && apt-get install -y maven
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src /app/src
RUN mvn clean package
COPY target/CICD_Homework-1.0.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
EXPOSE 8080
