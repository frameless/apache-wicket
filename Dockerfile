FROM maven:3.9-eclipse-temurin-17 AS builder

WORKDIR /app

# Create directories that are essential
# This only works when there is only one root `pom.xml` file.

RUN mkdir -p src/main/resources src/main/java src/main/webapp/login

COPY pom.xml .

RUN mvn dependency:go-offline

# Download dependencies
RUN mvn --offline install

COPY src ./src

# Download dependencies and build the application
RUN mvn --offline package -DskipTests

FROM tomcat:10-jdk17

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the builder stage
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Set environment variables
ENV CATALINA_OPTS="-Xmx512m"
ENV JAVA_OPTS="-Dwicket.configuration=DEVELOPMENT"

EXPOSE 8080
