# Stage 1: Build the application
# Use a Maven image that includes OpenJDK 21
FROM maven:latest as build

# Copy the project files to the container
COPY ./pom.xml /usr/src/myapp/pom.xml
COPY ./src /usr/src/myapp/src

# Set the working directory
WORKDIR /usr/src/myapp

# Package the application
RUN mvn clean package -DskipTests

# Stage 2: Create the Docker container
# Use an OpenJDK 21 image for the runtime
FROM openjdk:latest

# Copy the JAR file from the build stage
COPY --from=build /usr/src/myapp/target/*.jar /usr/app/app.jar

# Expose the port the application runs on
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java","-jar","/usr/app/app.jar"]

