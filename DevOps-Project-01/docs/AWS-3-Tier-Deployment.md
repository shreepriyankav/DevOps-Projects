# AWS 3-Tier Java Application Deployment Guide

## 1. Project Overview

Application: Nexora Java Login App
Architecture: AWS 3-Tier
Region: us-east-1 (N. Virginia)

The application is deployed using an Application Load Balancer, an Nginx web tier, a private Java application tier, and Amazon RDS for MySQL.

## 2. Architecture

User Browser
    |
    v
Application Load Balancer (HTTP :80)
    |
    v
Web EC2 - Nginx Reverse Proxy (<WEB_PRIVATE_IP>)
    |
    v
Private App EC2 - Java / Spring Boot (<APP_PRIVATE_IP>:8080)
    |
    v
Amazon RDS for MySQL (TCP :3306)

## 3. VPC and Networking

- VPC: java-3tier-vpc
- VPC CIDR: 10.0.0.0/16
- Public subnet 1: 10.0.0.0/20
- Public subnet 2: 10.0.16.0/20
- Private subnet 1: 10.0.128.0/20
- Private subnet 2: 10.0.144.0/20
- Internet Gateway attached to the VPC.
- Public route table routes internet traffic through the Internet Gateway.
- Application and database access should be restricted using security groups.

Note: Review the RDS DB subnet group and ensure it uses private subnets across the required Availability Zones.

## 4. Security Groups

### ALB Security Group
- Allow inbound HTTP on port 80 from the internet.
- Allow traffic to the registered web target.

### Web EC2 Security Group
- Allow SSH on port 22 only from the administrator's trusted IP.
- Allow HTTP on port 80 from the ALB security group.

### App EC2 Security Group
- Allow TCP port 8080 from the Web EC2 security group.
- Restrict administrative access to trusted sources.

### RDS Security Group
- Allow MySQL TCP port 3306 from the App EC2 security group only.
- Do not allow MySQL from 0.0.0.0/0 or an administrator's public IP unless there is a documented requirement.

## 5. Web Tier: Nginx

- Installed and configured Nginx on the Web EC2 instance.
- Configured Nginx to listen on port 80.
- Configured reverse proxy forwarding to the private App EC2 address on port 8080.
- Validated the Nginx configuration using nginx -t.
- Reloaded Nginx after configuration changes.
- Tested the local web endpoint and verified an HTTP 200 response.

The proxy forwards the Host, X-Real-IP, X-Forwarded-For, and X-Forwarded-Proto headers.

## 6. Application Tier: Java Service

- Deployed the application WAR file: dptweb-1.0.war.
- Configured Java 11 runtime.
- Configured the application to listen on port 8080.
- Created a protected environment file at /etc/java-login-app.env.
- Configured database connection settings using environment variables.
- Created the systemd service java-login-app.service.
- Enabled automatic startup at boot.
- Verified the service status and tested the local application endpoint.

Never store database passwords in this documentation or commit the environment file.

## 7. Database Tier: Amazon RDS

- Database instance: <RDS_INSTANCE_NAME>.
- Engine: MySQL 8.4.9.
- Database name: UserDB.
- Application database username: <DB_USERNAME>.
- Port: 3306.
- Configured security-group access from the App EC2 security group.
- Removed the administrator public-IP inbound rule.
- Disabled public accessibility.
- Verified the database status was Available.
- Tested application login after the RDS security changes.

Do not add database passwords or other secrets to Git.

## 8. Load Balancer

- Created the Application Load Balancer java-3tier-alb.
- Configured an HTTP listener on port 80.
- Created the target group java-3tier-web-tg.
- Registered the Web EC2 instance on port 80.
- Deregistered the App EC2 instance from the web target group.
- Verified the Web EC2 target health was Healthy.
- Tested the application through the ALB DNS endpoint.

Traffic flow: ALB -> Nginx -> Java application -> RDS.

## 9. Monitoring and Notifications

- Opened Amazon CloudWatch in us-east-1.
- Selected the EC2 CPUUtilization metric for the Web EC2 instance.
- Created the alarm Nexora-Web-CPU-Above-80.
- Created the SNS topic nexora-cpu-alerts.
- Confirmed the email subscription.
- Verified the alarm was in the OK state.

Important: Review the actual alarm threshold and evaluation period in AWS before considering monitoring complete. Restore the intended threshold after testing and verify that the alarm's In alarm action points to the SNS topic.

## 10. Validation Checklist

- [x] Application opens through the ALB URL.
- [x] Registration and login tested successfully.
- [x] Nginx reverse proxy returns an HTTP 200 response.
- [x] Java systemd service is running and enabled.
- [x] RDS is not publicly accessible.
- [x] RDS inbound access is restricted to the App EC2 security group.
- [x] Web EC2 target health is Healthy.
- [x] SNS email subscription is confirmed.
- [ ] Verify an actual CloudWatch alarm notification.
- [ ] Review RDS subnet group and ensure private-subnet placement.
- [ ] Review AWS costs and ongoing resource usage.

## 11. Troubleshooting Commands

Check Nginx:
sudo nginx -t
sudo systemctl status nginx --no-pager

Check the Java application:
sudo systemctl status java-login-app.service --no-pager
sudo systemctl is-enabled java-login-app.service
sudo journalctl -u java-login-app.service -n 50 --no-pager

Test the Java application locally:
curl -I http://localhost:8080/

Never paste database passwords, private keys, or secret environment values into terminal output shared publicly.

## 12. Cost and Cleanup

EC2, RDS, and the Application Load Balancer may incur ongoing charges. Review AWS Billing and Cost Explorer, and stop or delete resources only after confirming which components must be retained.

## 13. Future Improvements

- Manage infrastructure with Terraform.
- Use a dedicated private RDS subnet group across multiple Availability Zones.
- Configure HTTPS with ACM and an ALB HTTPS listener.
- Add least-privilege IAM roles.
- Review backups, deletion protection, and monitoring.
- Consider AWS Systems Manager Session Manager for administrative access.
