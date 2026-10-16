# Java Login Application | Spring Boot & DevOps

A web-based login and registration application built using Java, Spring Boot, JSP, and MySQL. This project demonstrates application development, database connectivity, Docker containerization, and Git-based version control as part of a hands-on DevOps learning journey.

## Overview

The application provides user registration, login, and dashboard pages with a MySQL database backend. It is packaged as a WAR file using Maven and can be deployed in a Docker container.

## Key Features

- User registration and login interface
- JSP-based web pages
- MySQL database integration
- Spring Boot MVC architecture
- Maven-based build and packaging
- Docker containerization
- Environment-variable-based database configuration
- Git and GitHub version control

## Technology Stack

| Category | Technologies |
|---|---|
| Language | Java |
| Framework | Spring Boot |
| Frontend | JSP, HTML, CSS |
| Database | MySQL |
| Build Tool | Maven |
| Containerization | Docker |
| Version Control | Git, GitHub |
| Runtime | Apache Tomcat via Spring Boot |

## Architecture

```text
User / Browser
      |
      v
Spring Boot Web Application
      |
      v
JSP Pages
(Login, Registration, Dashboard)
      |
      v
MySQL Database
(Employee Records)
```

## Project Structure

```text
Project-01-Java-Login-App/
├── src/
│   ├── main/
│   │   ├── java/com/dpt/demo/
│   │   ├── resources/
│   │   │   └── application.properties
│   │   └── webapp/pages/
│   └── test/
├── Dockerfile
├── pom.xml
├── .gitignore
└── README.md
```

## Run Locally

### Prerequisites

- Java 11 or compatible configured runtime
- Maven
- MySQL
- Docker (optional)

### 1. Clone the repository

```bash
git clone https://github.com/shreepriyankav/DevOps-Projects.git
cd DevOps-Projects/Project-01-Java-Login-App
```

### 2. Configure database credentials

Set these environment variables before starting the application. Use your own MySQL endpoint and credentials.

**PowerShell:**

```powershell
$env:DB_URL="jdbc:mysql://YOUR_DB_HOST:3306/UserDB"
$env:DB_USERNAME="YOUR_DB_USERNAME"
$env:DB_PASSWORD="YOUR_DB_PASSWORD"
```

Never commit real passwords, access keys, or other secrets to GitHub.

### 3. Build the application

```bash
mvn clean package
```

### 4. Run the application

Use the generated WAR file with the project's configured Spring Boot/Tomcat setup, ensuring the database environment variables are set.

Open the application at:

`http://localhost:8080`

## Docker Deployment

Build the Docker image:

```bash
docker build -t java-login-app:latest .
```

Run the container:

```powershell
docker run -d --name java-login-app-container -p 8081:8080 -e DB_URL -e DB_USERNAME -e DB_PASSWORD java-login-app:latest
```

Open:

`http://localhost:8081`

Ensure the container can reach the configured MySQL database and that the database security rules allow the required connection.

## Security Practices

- Database credentials are supplied through environment variables.
- Sensitive configuration files should not be committed.
- `.gitignore` excludes common local and build artifacts.
- Database access should be restricted to trusted application hosts.
- Production deployments should use a secrets manager and HTTPS.

## Learning Outcomes

- Building a Java web application with Spring Boot and JSP
- Connecting a web application to MySQL
- Packaging applications with Maven
- Containerizing applications with Docker
- Managing code with Git and GitHub
- Configuring applications using environment variables

## Future Enhancements

- Add automated CI/CD with Jenkins or GitHub Actions
- Integrate code quality and dependency vulnerability scanning
- Add automated unit and integration tests
- Deploy to AWS using secure networking and managed database services
- Implement stronger authentication and password hashing

## Author

**Shree Priyanka V L**

- GitHub: [@shreepriyankav](https://github.com/shreepriyankav)
- LinkedIn: [Shree Priyanka](https://linkedin.com/in/shree-priyanka-a163692b5/)

---

*Part of a hands-on Java, AWS, and DevOps project portfolio.*