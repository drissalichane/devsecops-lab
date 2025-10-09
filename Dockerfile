# Use a lightweight and secure Java base image
FROM eclipse-temurin:21-jre-alpine

# Create a non-root user (important for security)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory
WORKDIR /app

# Copy your application JAR file into the image
COPY target/*.jar app.jar

# Switch to non-root user
USER appuser

# Expose the app port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
