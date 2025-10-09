# VULNERABLE VERSION: Node.js 12 base (has known vulnerabilities)
# We'll install Java on top of it
FROM node:12-buster-slim

# Install old Java 11
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY target/*.jar app.jar

# VULNERABILITY: Running as root user
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]