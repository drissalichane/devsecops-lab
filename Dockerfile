# VULNERABLE VERSION: Using CentOS 7 (EOL June 2024)
FROM centos:7

# Install Java 8
RUN yum update -y && \
    yum install -y java-1.8.0-openjdk-headless && \
    yum clean all

# Create application directory
WORKDIR /app

# Copy the JAR file
COPY target/*.jar app.jar

# VULNERABILITY: Running as root user
# No user isolation

# Expose the application port
EXPOSE 8080

# Run as root
CMD ["java", "-jar", "app.jar"]