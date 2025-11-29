# Stage 1: Build
FROM maven:3.9-eclipse-temurin-21-alpine as builder
WORKDIR /app

COPY pom.xml .
COPY src ./src

# Use Maven Wrapper for the build
RUN --mount=type=cache,target=/root/.m2 mvn package -Dmaven.test.skip=true

# Stage 2: Run
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Copying JAR
COPY --from=builder /app/target/*.jar app.jar

# Run
ENTRYPOINT ["java", "-jar", "app.jar"]