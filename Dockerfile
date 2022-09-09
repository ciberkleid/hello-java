FROM adoptopenjdk:11-jdk-hotspot AS build
RUN apt-get update && apt-get install -y --no-install-recommends \
       maven=3.6* \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/*
WORKDIR /workspace
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ src/
RUN mvn clean package -DskipTests --offline

FROM adoptopenjdk:11-jre-hotspot
LABEL maintainer="me@example.com"
WORKDIR /workspace
COPY --from=build /workspace/target/*.jar app.jar
USER 1002
CMD ["java", "-jar", "app.jar"]
