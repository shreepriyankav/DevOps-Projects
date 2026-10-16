\# Nexora — Java Login Application on AWS 3-Tier Architecture



\## Table of Contents



\- \[Project Overview](#project-overview)

\- \[Architecture Overview](#architecture-overview)

\- \[Prerequisites](#prerequisites)

\- \[AWS Infrastructure](#aws-infrastructure)

\- \[Network and Security Configuration](#network-and-security-configuration)

\- \[Database Configuration](#database-configuration)

\- \[Application Build](#application-build)

\- \[Application Deployment](#application-deployment)

\- \[Load Balancer and Nginx Configuration](#load-balancer-and-nginx-configuration)

\- \[Monitoring and Maintenance](#monitoring-and-maintenance)

\- \[Security Best Practices](#security-best-practices)

\- \[Troubleshooting Guide](#troubleshooting-guide)

\- \[Cost Management](#cost-management)

\- \[Future Improvements](#future-improvements)

\- \[Contributing](#contributing)

\- \[Author](#author)



\## Project Overview



\### Introduction



This project demonstrates the deployment of the \*\*Nexora Java Login Application\*\* using a three-tier architecture on Amazon Web Services (AWS).



The application is built with Java and Spring Boot and packaged as a WAR file. Nginx acts as the web-tier reverse proxy, the Java application runs on a private EC2 instance, and Amazon RDS for MySQL provides the database layer.



The architecture separates web traffic, application processing, and database storage to improve maintainability and restrict direct access to internal resources.



\### Key Features



\- \*\*Three-tier architecture:\*\* Separate web, application, and database layers.

\- \*\*Application Load Balancer:\*\* Routes incoming HTTP traffic to the web tier.

\- \*\*Nginx reverse proxy:\*\* Forwards application requests to the private Java application server.

\- \*\*Java application deployment:\*\* Runs as a Linux systemd service.

\- \*\*Amazon RDS for MySQL:\*\* Stores application data in a managed database.

\- \*\*Environment-based configuration:\*\* Database credentials are supplied through environment variables.

\- \*\*Network isolation:\*\* The application server and database are not intended to be directly accessible from the public internet.

\- \*\*Operational troubleshooting:\*\* Uses Linux, Nginx, systemd, and AWS monitoring tools.



> \*\*Implementation note:\*\* This documentation describes the current project setup. Auto Scaling, CloudFront, ElastiCache, Multi-AZ database deployment, and other optional services are not presented as implemented features.



\## Architecture Overview



\### Architecture Diagram



```mermaid

flowchart TD

&#x20;   U\[Users / Browser]

&#x20;   ALB\[AWS Application Load Balancer]

&#x20;   WEB\[Public Web Tier<br/>EC2 + Nginx]

&#x20;   APP\[Private Application Tier<br/>EC2 + Java Spring Boot]

&#x20;   DB\[Private Database Tier<br/>Amazon RDS for MySQL]



&#x20;   U -->|HTTP traffic| ALB

&#x20;   ALB -->|HTTP port 80| WEB

&#x20;   WEB -->|Reverse proxy to port 8080| APP

&#x20;   APP -->|MySQL port 3306| DB

```



\### Presentation Tier — Web Layer



\*\*Technology:\*\* Amazon EC2 and Nginx



Responsibilities:



\- Receive requests forwarded by the Application Load Balancer.

\- Handle HTTP reverse-proxy configuration.

\- Forward application requests to the Java backend.

\- Keep the backend application port inaccessible to unauthorized clients.



\### Application Tier — Backend Layer



\*\*Technology:\*\* Amazon EC2, Java, Spring Boot, and systemd



Responsibilities:



\- Run the Nexora Java web application.

\- Process application requests.

\- Communicate with the MySQL database.

\- Load database connection settings from environment variables.

\- Start and restart the application through systemd.



\### Data Tier — Database Layer



\*\*Technology:\*\* Amazon RDS for MySQL



Responsibilities:



\- Store application data.

\- Accept database connections from the authorized application tier.

\- Keep the database endpoint private.

\- Use restricted security group rules and managed database operations.



\### AWS Services Used



| Service | Purpose |

|---|---|

| Amazon VPC | Isolated network for project resources |

| Public and private subnets | Separate internet-facing and internal resources |

| Application Load Balancer | Distributes incoming traffic to the web tier |

| Amazon EC2 | Hosts Nginx and the Java application |

| Nginx | Reverse proxy to the backend |

| Amazon RDS for MySQL | Managed relational database |

| Security Groups | Control inbound and outbound network access |

| Amazon CloudWatch | Monitoring and logs where configured |

| Amazon SNS | Notifications where configured |



\## Prerequisites



Before deployment, ensure you have:



\- An AWS account with the necessary permissions.

\- Git installed on your development machine.

\- Java and Maven, or the project's Maven wrapper.

\- An SSH client or AWS EC2 Instance Connect access.

\- An existing VPC with appropriately configured subnets and routing.

\- Configured EC2 instances, security groups, ALB, and RDS resources.

\- Database credentials stored securely outside source control.



The application is maintained in the following repository:



\[DevOps-Projects on GitHub](https://github.com/shreepriyankav/DevOps-Projects)



\## AWS Infrastructure



\### 1. VPC and Networking



The project uses a VPC in the `us-east-1` AWS Region.



The network separates the public web tier from the private application and database tiers.



The intended traffic flow is:



1\. Users send requests to the Application Load Balancer.

2\. The ALB forwards requests to the web EC2 instance.

3\. Nginx forwards application requests to the private application EC2 instance.

4\. The application connects to RDS using MySQL port `3306`.



The web and application instances communicate through private network addresses. RDS should remain inaccessible directly from the public internet.



\### 2. Infrastructure Verification



Use the AWS Management Console or AWS CLI to inspect existing resources before making changes.



```bash

aws ec2 describe-instances --region us-east-1

```



Check the ALB target health:



```bash

aws elbv2 describe-target-health \\

&#x20; --target-group-arn YOUR\_TARGET\_GROUP\_ARN \\

&#x20; --region us-east-1

```



Replace `YOUR\_TARGET\_GROUP\_ARN` with the actual target group ARN.



These commands inspect existing infrastructure; they do not create or modify resources.



\## Network and Security Configuration



Configure security groups according to the following traffic requirements.



| Resource | Port | Allowed source |

|---|---:|---|

| Application Load Balancer | 80 | Intended client networks; `0.0.0.0/0` only if public HTTP access is required |

| Web EC2 / Nginx | 80 | ALB security group |

| Application EC2 | 8080 | Web EC2 security group |

| RDS MySQL | 3306 | Application EC2 security group |

| EC2 SSH | 22 | Authorized administrator IP or approved access mechanism |



Use the actual security group IDs and subnet configuration in your AWS environment.



\### Security Guidelines



\- Do not expose the application port `8080` directly to the public internet.

\- Do not allow public access to the RDS database.

\- Restrict SSH access to authorized administrators.

\- Prefer HTTPS for production-facing traffic.

\- Use least-privilege IAM permissions.

\- Verify security group rules before modifying them.



\## Database Configuration



\### Amazon RDS for MySQL



The project uses an Amazon RDS MySQL database named `UserDB`.



Configure the application with the following environment variables:



| Variable | Purpose |

|---|---|

| `DB\_URL` | JDBC connection URL |

| `DB\_USERNAME` | Database username |

| `DB\_PASSWORD` | Database password |



Example connection URL format:



```text

jdbc:mysql://YOUR\_PRIVATE\_RDS\_ENDPOINT:3306/UserDB

```



Replace the placeholder with the actual private RDS endpoint.



\### Database Security



\- Keep the database endpoint private.

\- Store credentials outside Git.

\- Use a dedicated database account with only the permissions required by the application.

\- Use parameterized SQL queries for database operations.

\- Review database backups and retention settings.

\- Confirm that the application can reach RDS before troubleshooting application-level errors.



Do not place real passwords, private connection details intended to remain confidential, or AWS credentials in public documentation.



\## Application Build



\### 1. Clone the Repository



```powershell

git clone https://github.com/shreepriyankav/DevOps-Projects.git

cd DevOps-Projects

```



\### 2. Navigate to the Java Application



```powershell

cd .\\DevOps-Project-01\\Project-01-Java-Login-App

```



\### 3. Build the Application



Use the project's Maven wrapper:



```powershell

.\\mvnw.cmd clean package

```



Review the Maven output for compilation or test failures.



The expected WAR artifact for this project is:



```text

target\\dptweb-1.0.war

```



Verify the artifact exists:



```powershell

Test-Path .\\target\\dptweb-1.0.war

```



If the build reports test failures, investigate them rather than automatically skipping tests.



\## Application Deployment



\### 1. Application Runtime



The Java application runs on the private application EC2 instance and listens on port `8080`.



The systemd service is named:



```text

java-login-app.service

```



Check service status:



```bash

sudo systemctl status java-login-app.service --no-pager

```



Check whether it starts automatically at boot:



```bash

sudo systemctl is-enabled java-login-app.service

```



Restart the application after a deployment when appropriate:



```bash

sudo systemctl restart java-login-app.service

```



Inspect recent application logs:



```bash

sudo journalctl -u java-login-app.service -n 100 --no-pager

```



Follow logs in real time:



```bash

sudo journalctl -u java-login-app.service -f

```



\### 2. Database Environment Variables



Configure `DB\_URL`, `DB\_USERNAME`, and `DB\_PASSWORD` in the application's runtime environment using a secure administrative process.



For a systemd service, environment variables can be supplied through a protected environment file or another appropriate secrets-management mechanism.



Example configuration format:



```text

DB\_URL=jdbc:mysql://YOUR\_PRIVATE\_RDS\_ENDPOINT:3306/UserDB

DB\_USERNAME=YOUR\_DATABASE\_USERNAME

DB\_PASSWORD=YOUR\_DATABASE\_PASSWORD

```



This is an illustrative template, not a file to commit with real credentials. Restrict access to the configuration file and ensure Git ignores it.



After changing the service environment, restart the service and check the logs.



\## Load Balancer and Nginx Configuration



\### 1. Application Load Balancer



The Application Load Balancer receives incoming HTTP requests and forwards them to the web tier through its target group.



Verify:



\- The ALB listener is configured.

\- The web EC2 instance is registered in the correct target group.

\- The target health check succeeds.

\- The ALB security group permits the required inbound traffic.

\- The web instance accepts HTTP traffic from the ALB security group.



\### 2. Nginx Reverse Proxy



The web EC2 instance uses Nginx to forward incoming requests to the private Java application server.



Illustrative configuration:



```nginx

server {

&#x20;   listen 80;

&#x20;   server\_name \_;



&#x20;   location / {

&#x20;       proxy\_pass http://YOUR\_APP\_PRIVATE\_IP:8080;

&#x20;       proxy\_http\_version 1.1;



&#x20;       proxy\_set\_header Host $host;

&#x20;       proxy\_set\_header X-Real-IP $remote\_addr;

&#x20;       proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;

&#x20;       proxy\_set\_header X-Forwarded-Proto $scheme;

&#x20;   }

}

```



Replace `YOUR\_APP\_PRIVATE\_IP` with the current private IP of the application instance. This is a reference configuration, not a command to overwrite an existing Nginx configuration without reviewing it.



Validate the Nginx configuration:



```bash

sudo nginx -t

```



Reload Nginx after a successful validation:



```bash

sudo systemctl reload nginx

```



Check the service:



```bash

sudo systemctl status nginx --no-pager

```



\## Monitoring and Maintenance



\### Application Monitoring



Use systemd and application logs to investigate:



\- Application startup failures.

\- Database connection errors.

\- Port conflicts.

\- Java runtime exceptions.

\- Unexpected service restarts.



Useful commands:



```bash

sudo systemctl status java-login-app.service --no-pager

sudo journalctl -u java-login-app.service -n 100 --no-pager

```



\### Nginx Monitoring



Check Nginx service health:



```bash

sudo systemctl status nginx --no-pager

```



Check its configuration:



```bash

sudo nginx -t

```



Review Nginx logs when requests fail:



```bash

sudo tail -n 100 /var/log/nginx/error.log

sudo tail -n 100 /var/log/nginx/access.log

```



\### AWS Monitoring



Where configured, use Amazon CloudWatch to review relevant instance metrics, application logs, alarms, and infrastructure events.



If SNS notifications are configured, verify that the relevant alarm or event actually triggers a notification before relying on it.



\## Security Best Practices



\### Network Security



\- Restrict inbound traffic using security groups.

\- Keep internal application and database services private.

\- Avoid unnecessarily opening ports.

\- Review routes and subnet associations before changing networking.



\### Application Security



\- Keep secrets outside source control.

\- Use parameterized SQL queries.

\- Validate application input.

\- Review application logs for accidental sensitive-data exposure.

\- Apply relevant operating system and application security updates.



\### Database Security



\- Restrict MySQL access to the application security group.

\- Use appropriately scoped database permissions.

\- Review RDS encryption, backup, and retention settings.

\- Rotate credentials when required.



\### AWS Account Security



\- Apply least-privilege IAM policies.

\- Protect administrative access.

\- Monitor unexpected resource changes and costs.

\- Avoid committing access keys, private keys, or populated secret files.



\## Troubleshooting Guide



\### 1. Website Is Not Reachable



Check:



1\. ALB state and listener configuration.

2\. Target group health.

3\. Web EC2 instance status.

4\. Nginx service status.

5\. Security group rules and network routes.



Commands:



```bash

sudo systemctl status nginx --no-pager

sudo nginx -t

```



\### 2. Application Returns an Error



Check the Java service:



```bash

sudo systemctl status java-login-app.service --no-pager

sudo journalctl -u java-login-app.service -n 100 --no-pager

```



Confirm that the application is listening on the expected port:



```bash

sudo ss -lntp | grep ':8080'

```



\### 3. Nginx Returns 502 Bad Gateway



Possible causes include:



\- The Java service is stopped.

\- The backend private IP or port is incorrect.

\- The application is not listening on port `8080`.

\- The web-to-application security group rule is missing.

\- Nginx contains an invalid upstream configuration.



Review the Nginx error log and test connectivity from the web instance to the application instance.



\### 4. Database Connection Fails



Check:



\- `DB\_URL`, `DB\_USERNAME`, and `DB\_PASSWORD`.

\- The RDS endpoint, port, and database name.

\- RDS instance availability.

\- The RDS security group rule allowing MySQL from the application security group.

\- Database permissions and application logs.



Do not print passwords or secrets when debugging.



\### 5. Application Does Not Start After a Reboot



Check:



```bash

sudo systemctl is-enabled java-login-app.service

sudo systemctl status java-login-app.service --no-pager

sudo journalctl -u java-login-app.service -b --no-pager

```



Confirm that the service is enabled, its configuration is valid, and the Java runtime is available.



\## Cost Management



AWS resources may incur charges even when the application is not receiving traffic.



Before finishing a test deployment:



\- Stop EC2 instances that are not needed, after confirming they are safe to stop.

\- Review ALB charges and delete it only when it is no longer required.

\- Review RDS instance, storage, and backup charges before changing or deleting the database.

\- Check for unattached Elastic IP addresses, snapshots, and other unused resources.

\- Review current AWS billing and Cost Explorer.

\- Keep required data and backups before removing infrastructure.



Stopping an instance does not eliminate every associated charge. Review each resource separately.



\## Future Improvements



Potential enhancements, subject to implementation and testing:



\- HTTPS using an appropriate TLS certificate.

\- Infrastructure as Code using Terraform.

\- Automated deployment through a CI/CD pipeline.

\- More comprehensive CloudWatch dashboards and alarms.

\- Improved secrets management.

\- Automated backups and documented recovery procedures.

\- Multi-AZ architecture and Auto Scaling for higher availability.

\- Further application security and automated testing.



These are future improvements, not claims about the current deployment.



\## Contributing



Contributions that improve application quality, deployment reliability, documentation, security, or learning outcomes are welcome.



Before submitting changes:



1\. Read the repository's `CONTRIBUTING.md`.

2\. Follow the project's code and documentation conventions.

3\. Test relevant changes.

4\. Remove credentials and sensitive information.

5\. Update this deployment guide when the architecture or deployment process changes.



\## Author



\*\*Shree Priyanka V L\*\*



\- GitHub: \[shreepriyankav](https://github.com/shreepriyankav)

\- LinkedIn: \[Shree Priyanka](https://www.linkedin.com/in/shree-priyanka-a163692b5/)



\---



This documentation describes the Nexora Java Login Application's AWS deployment and may evolve as the project is improved. Verify resource configurations in AWS before applying infrastructure changes.
