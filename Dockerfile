# VULNERABILITY: Using old Ubuntu version with many known CVEs
FROM ubuntu:18.04

# VULNERABILITY: Installing old Java 8 which has security issues
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get clean

# Create application directory
WORKDIR /app

# Copy the JAR file
COPY target/*.jar app.jar

# VULNERABILITY: Running as root user (violates least privilege principle)
# The container runs with root privileges, which is dangerous

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]