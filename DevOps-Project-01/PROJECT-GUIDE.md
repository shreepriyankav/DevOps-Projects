# Nexora Java Login Application – Project Guide

## Table of Contents

1. [Project Overview](#project-overview)
2. [Architecture Overview](#architecture-overview)
3. [Prerequisites](#prerequisites)
4. [AWS Infrastructure](#aws-infrastructure)
5. [Application Build and Configuration](#application-build-and-configuration)
6. [AWS Deployment](#aws-deployment)
7. [Security Best Practices](#security-best-practices)
8. [Monitoring and Maintenance](#monitoring-and-maintenance)
9. [Troubleshooting](#troubleshooting)
10. [Cost Management](#cost-management)
11. [Related Documentation](#related-documentation)
12. [Contributing](#contributing)

---

## Project Overview

### Introduction

The Nexora Java Login Application is a Java web application deployed on AWS using a three-tier architecture.

This project demonstrates how to deploy a Java application, configure web and application servers, connect to a managed MySQL database, and apply network security practices in AWS.

The project is intended for learning and demonstrating AWS, Java application deployment, Linux administration, networking, and DevOps concepts.

### Project Objectives

- Deploy a Java web application on AWS EC2.
- Use an Application Load Balancer (ALB) to receive incoming web traffic.
- Configure Nginx as a reverse proxy on the web tier.
- Run the Java application on a private application-tier EC2 instance.
- Connect the application to Amazon RDS for MySQL.
- Manage the application using `systemd`.
- Store database configuration in environment variables instead of committing credentials to Git.
- Understand AWS networking, security groups, troubleshooting, and cost management.

## Architecture Overview

### Three-Tier Architecture

The deployment uses the following request flow:

```text
                         Users
                           |
                           v
               Application Load Balancer
                           |
                           v
                  Public Web EC2
                       Nginx
                           |
                           v
                  Private App EC2
                Spring Boot Java WAR
                  systemd service
                           |
                           v
                  Private Amazon RDS
                       MySQL
```

### Architecture Components

| Component | Purpose |
|---|---|
| Amazon VPC | Provides the network environment for the deployment. |
| Application Load Balancer | Receives HTTP requests and forwards them to the web tier. |
| Public Web EC2 | Runs Nginx as the reverse proxy. |
| Private App EC2 | Runs the Java application on port 8080. |
| Amazon RDS for MySQL | Stores application data in a managed relational database. |
| Security Groups | Control permitted traffic between the tiers. |
| systemd | Starts and manages the Java application service. |
| CloudWatch and SNS | Can be used for monitoring and notifications where configured. |

**Important:** This guide documents the implemented deployment. Auto Scaling, CloudFront, NAT Gateway, Multi-AZ database deployment, and additional high-availability components are not assumed to be configured.

## Prerequisites

Before working with the project, prepare the following:

- An AWS account with permission to manage the required resources.
- Git installed on your development machine.
- Java and Maven, or the project's Maven Wrapper.
- A Windows PowerShell terminal or Linux shell.
- SSH access to EC2 where required.
- Basic knowledge of AWS EC2, VPC, security groups, Linux, Java, and MySQL.

### Verify Local Tools

In Windows PowerShell:

```powershell
git --version
java -version
docker --version
```

Check the Maven Wrapper from the application directory:

```powershell
cd D:\DevOps-Projects\DevOps-Project-01\Project-01-Java-Login-App
.\mvnw.cmd -version
```

Docker is useful for container-based workflows but is not required to run the deployed application as a `systemd` service on EC2.

## AWS Infrastructure

### Region

The project deployment is in:

```text
us-east-1
```

### Network Layout

The architecture separates the public web tier from the private application and database tiers.

- The ALB receives user requests.
- The web EC2 instance runs Nginx.
- The application EC2 instance runs the Java service on port 8080.
- The RDS MySQL database accepts connections only from authorized sources.

### Security Group Traffic

| Source | Destination | Port | Purpose |
|---|---|---:|---|
| Internet | ALB | 80/443, as configured | Web access |
| ALB security group | Web EC2 security group | 80 | Forward web requests |
| Web EC2 security group | App EC2 security group | 8080 | Forward requests to Java |
| App EC2 security group | RDS security group | 3306 | Database connectivity |
| Authorized administrator IP | EC2 | 22, if required | SSH administration |

Configure only the ports needed by the actual deployment. Do not expose the application port or database port directly to the public internet.

### Database Configuration

The application connects to Amazon RDS for MySQL using environment variables:

- `DB_URL` — JDBC connection URL.
- `DB_USERNAME` — database username.
- `DB_PASSWORD` — database password.

Do not commit actual passwords, AWS access keys, private keys, or other credentials to Git.

## Application Build and Configuration

### 1. Open the Application Directory

```powershell
cd D:\DevOps-Projects\DevOps-Project-01\Project-01-Java-Login-App
```

### 2. Build the Application

```powershell
.\mvnw.cmd clean package
```

The expected WAR artifact is:

```text
target\dptweb-1.0.war
```

Check that the WAR exists:

```powershell
Test-Path .\target\dptweb-1.0.war
```

Expected result:

```text
True
```

If the build fails, review the Maven error output and resolve compilation, dependency, or test issues before deployment.

### 3. Configure Database Environment Variables

Configure the following variables in the appropriate runtime environment:

```text
DB_URL=jdbc:mysql://<RDS-ENDPOINT>:3306/UserDB
DB_USERNAME=<DATABASE-USERNAME>
DB_PASSWORD=<DATABASE-PASSWORD>
```

Replace the placeholders with the correct values for your environment.

These are configuration examples, not credentials to commit into the repository. Use an appropriately protected service environment file or a secrets-management solution, and restrict access to it.

### 4. Verify the Application Configuration

Confirm that the Spring application reads the environment variables rather than relying on credentials hardcoded in source files.

Check that:

- The JDBC URL points to the intended database.
- The database name is correct.
- The database user has the required permissions.
- The RDS security group permits connections from the application tier.
- The Java runtime is compatible with the application build.

## AWS Deployment

### 1. Verify the Web Tier

Connect to the public web EC2 instance and check Nginx:

```bash
sudo systemctl status nginx --no-pager
sudo nginx -t
```

If configuration changes are required, test them before reloading Nginx:

```bash
sudo systemctl reload nginx
```

The Nginx reverse proxy should forward requests to the private application instance on port 8080.

### 2. Verify the Application Tier

Connect to the private application EC2 instance using your approved access method.

Check the service:

```bash
sudo systemctl status java-login-app.service --no-pager
```

Confirm whether it starts automatically:

```bash
sudo systemctl is-enabled java-login-app.service
```

Review application logs:

```bash
sudo journalctl -u java-login-app.service -n 100 --no-pager
```

Follow new log entries when troubleshooting:

```bash
sudo journalctl -u java-login-app.service -f
```

### 3. Verify Database Connectivity

From the application tier, check whether the RDS endpoint is reachable on port 3306:

```bash
nc -vz <RDS-ENDPOINT> 3306
```

If the command is unavailable, use an approved network diagnostic tool.

Network connectivity alone does not prove that database authentication or SQL operations work. Verify the application logs and database configuration as well.

### 4. Verify the Load Balancer

In the AWS Management Console:

1. Open EC2 and select **Load Balancers**.
2. Select the project's Application Load Balancer.
3. Review its listeners and target group.
4. Check target health.
5. Open the application's configured public URL and verify that the expected page loads.

For detailed deployment instructions and the current Nginx configuration, refer to `docs/AWS-3-Tier-Deployment.md`.

## Security Best Practices

### Network Security

- Keep the application EC2 and RDS database in private subnets where configured.
- Restrict SSH to trusted administrator IP addresses.
- Permit application traffic only from the intended web tier.
- Permit MySQL traffic only from the application tier.
- Do not expose database credentials or private infrastructure configuration unnecessarily.

### Application Security

- Read database credentials from protected environment variables or a secrets manager.
- Use parameterized SQL queries and validate user input.
- Avoid logging passwords, session tokens, or other sensitive data.
- Keep Java, application dependencies, and operating-system packages updated.
- Review authentication, session handling, and error handling before production use.

### Repository Security

Before committing changes:

```powershell
git diff --check
git status -sb
```

Review the staged changes before committing. Never commit `.env` files containing real credentials, private keys, or AWS secrets.

If credentials are exposed, revoke or rotate them immediately. Removing a secret from the latest commit does not necessarily remove it from Git history.

For reporting security issues, refer to `SECURITY.md`.

## Monitoring and Maintenance

### Service Health

Check the Java application:

```bash
sudo systemctl is-active java-login-app.service
```

Check Nginx:

```bash
sudo systemctl is-active nginx
```

Review logs when a service fails, restarts unexpectedly, or returns errors.

### AWS Monitoring

Where configured, use Amazon CloudWatch to review EC2 metrics, application logs, load balancer health, and RDS performance.

Amazon SNS can be used to send notifications from configured alarms.

Do not assume that a metric, log group, alarm, or notification is active until it has been verified in the AWS account.

### Maintenance Checklist

- Verify the public application URL.
- Check the health of the ALB targets.
- Check Nginx and Java service status.
- Review application errors and database connectivity.
- Review security group rules.
- Review AWS costs and unused resources.
- Keep deployment and troubleshooting documentation updated.

## Troubleshooting

| Problem | What to check |
|---|---|
| Website does not open | ALB listener, target health, web EC2 status, Nginx service, and security groups. |
| ALB target is unhealthy | Target group health-check path and port, Nginx availability, and web-tier connectivity. |
| Nginx returns 502 Bad Gateway | Private app IP, port 8080, Java service status, and web-to-app security group rules. |
| Java application fails to start | `systemctl` status, `journalctl` logs, Java runtime, WAR file, and environment variables. |
| Database connection fails | RDS endpoint, port 3306, database credentials, database name, and security group rules. |
| Login or database operation fails | Application logs, SQL query handling, schema, and database permissions. |
| Service does not start after reboot | `systemctl is-enabled java-login-app.service` and the service configuration. |

### Useful Commands

```bash
# Java service
sudo systemctl status java-login-app.service --no-pager

# Java service logs
sudo journalctl -u java-login-app.service -n 100 --no-pager

# Nginx configuration
sudo nginx -t

# Nginx service
sudo systemctl status nginx --no-pager

# Listening ports
sudo ss -lntp

# Disk usage
df -h

# Memory usage
free -m
```

## Cost Management

AWS resources can continue generating charges while running, even if the application is not being used.

- Review EC2, RDS, ALB, EBS, and other active resource charges.
- Stop or delete resources that are no longer needed, where appropriate.
- Check for unattached Elastic IPs, unused volumes, snapshots, and other billable resources.
- Take required backups before deleting resources.
- Confirm that the database and application are no longer needed before removing them.
- Check AWS Billing and Cost Management for actual charges.

Stopping an EC2 instance does not automatically stop charges for every associated resource.

## Related Documentation

- [`README.md`](README.md) — Project overview and entry point.
- [`CONTRIBUTING.md`](CONTRIBUTING.md) — Contribution guidelines.
- [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) — Community standards.
- [`SECURITY.md`](SECURITY.md) — Security reporting and policy.
- [`docs/AWS-3-Tier-Deployment.md`](docs/AWS-3-Tier-Deployment.md) — Detailed AWS deployment guide.

## Contributing

Contributions that improve application reliability, security, documentation, testing, or deployment are welcome.

1. Review `CONTRIBUTING.md`.
2. Create a separate branch for your changes.
3. Test the changes where practical.
4. Run `git diff --check`.
5. Review your changes and ensure no secrets are included.
6. Commit your changes and open a pull request according to the repository's contribution process.

## Disclaimer

This project is an educational deployment and a demonstration of AWS and DevOps practices. It should not be considered production-ready solely because it runs successfully.

A production deployment requires additional validation of availability, backups, access control, encryption, monitoring, disaster recovery, application security, and operational procedures.
