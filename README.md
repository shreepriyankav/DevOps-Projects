# DevOps Projects Portfolio

Welcome to my DevOps and Cloud Engineering portfolio. This repository contains hands-on projects focused on AWS infrastructure, CI/CD, containerization, automation, and monitoring.

## Project 01 – Nexora Java Login App (AWS 3-Tier Architecture)

### Overview
Deployed a Java Spring Boot login application on AWS using a three-tier architecture with a load balancer, web tier, application tier, and managed MySQL database.

### Architecture
User → Application Load Balancer → Web EC2 (Nginx Reverse Proxy) → App EC2 (Java/Spring Boot) → Amazon RDS for MySQL

### AWS Services and Technologies
- Amazon VPC, public and private subnets
- Application Load Balancer (ALB) and Target Group health checks
- Amazon EC2 running Nginx and the Java application
- Amazon RDS for MySQL
- Security Groups to restrict tier-to-tier traffic
- Amazon CloudWatch CPU alarm
- Amazon SNS email notifications
- Linux, Java, Spring Boot, and systemd

### Implementation Highlights
- Configured Nginx on the Web EC2 instance to forward HTTP requests to the private application server.
- Configured the Java application as a systemd service for automatic startup and restart on failure.
- Stored database connection settings in a protected environment file instead of hardcoding credentials in application configuration.
- Restricted database inbound access to the application tier security group.
- Disabled public accessibility for the RDS database.
- Configured an ALB health check and verified the Web EC2 target was healthy.
- Created a CloudWatch CPU utilization alarm with an SNS email notification topic.

### Validation
- Application accessible through the ALB DNS endpoint.
- Registration and login tested successfully.
- RDS connectivity verified after disabling public access.
- ALB target health confirmed as Healthy.

### Security Notes
- Do not commit database passwords, private keys, environment files containing secrets, or AWS credentials.
- Keep database access restricted to the application tier.
- Review CloudWatch alarm thresholds after testing and restore the intended production threshold.

## About Me
I am a postgraduate Computer Science and Engineering student interested in AWS, DevOps, automation, and cloud technologies.

## Connect With Me
- GitHub: https://github.com/shreepriyankav
- LinkedIn: https://linkedin.com/in/shree-priyanka-a163692b5/
