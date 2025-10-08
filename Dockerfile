# VULNERABLE VERSION: Using Ubuntu 18.04 (EOL April 2023)
FROM ubuntu:18.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install old Java 8 (has known vulnerabilities)
RUN apt-get update && \
    apt-get install -y openjdk-8-jre-headless wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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