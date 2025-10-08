# VULNERABLE VERSION: Using deprecated Debian Jessie (EOL since 2020)
FROM debian:jessie

# Install old Java 7 (has many known vulnerabilities)
RUN apt-get update && \
    apt-get install -y openjdk-7-jre && \
    apt-get clean

# Create application directory
WORKDIR /app

# Copy the JAR file
COPY target/*.jar app.jar

# VULNERABILITY: Running as root user (violates least privilege principle)
# No user creation - runs with full root privileges

# Expose the application port
EXPOSE 8080

# Run the application as root
CMD ["java", "-jar", "app.jar"]