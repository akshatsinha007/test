################################# Build Container ###############################

# Base Image for Build Container
FROM maven:3.9.9-amazoncorretto-21-debian  as base

# Moving into working directory
WORKDIR /build

# Copying pom.xml file initially for caching
COPY pom.xml .

# Downloading Dependencies 
RUN mvn dependency:go-offline

# Copying files to /build/src/ inside container
COPY src/ /build/src/

# Building package 
RUN mvn clean package

################################# Prod Container #################################

# Base Image for Prod Container
FROM openjdk:21-jdk-slim

# Exposing Port of this new container
EXPOSE 8080

# Copying the executable jar file build on previous container
COPY --from=base /build/target/*.jar /app/demo.jar

# Uncomment if you want to run default commands during the initialization of this container
CMD ["java","-jar","/app/demo.jar"]  
