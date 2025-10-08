# DevSecOps Lab - Vulnerable Spring Boot Application

This is an intentionally vulnerable Spring Boot application created for learning DevSecOps principles.

## Known Vulnerabilities
- SQL Injection in user search endpoint
- Hardcoded secrets in configuration
- Vulnerable dependency (Commons Te xt 1.9)
- Insecure Docker configurationcd
 
## Running Locally
```bash
mvn spring-boot:run