# Still an old Node.js version — intentionally vulnerable
FROM node:12-buster-slim

# Switch Debian sources to the archived EOL repositories
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99ignore-release-date && \
    apt-get update && \
    apt-get install -y openjdk-11-jre-headless wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY target/*.jar app.jar

# Still running as root (intentional vulnerability)
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
