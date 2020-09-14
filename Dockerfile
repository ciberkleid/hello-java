FROM adoptopenjdk:11-jdk-hotspot AS build
WORKDIR /workspace
COPY .mvn .mvn
COPY mvnw mvnw
COPY pom.xml .
RUN ./mvnw dependency:go-offline
COPY src/ src/
RUN ./mvnw clean package -DskipTests --offline

FROM adoptopenjdk:11-jre-hotspot
LABEL maintainer="me@example.com"
WORKDIR /workspace
COPY --from=build /workspace/target/*.jar app.jar
USER 1002
CMD ["java", "-jar", "app.jar"]
