# aws-production-3tier-devops-project
End-to-End Production-Grade AWS 3-Tier DevOps Project featuring High Availability, Scalability, Route 53, ALB, Auto Scaling, Bastion Host, NAT Gateway, RDS Multi-AZ, CloudWatch, SNS, SQS, Terraform, Docker, Ansible and CI/CD.
# AWS Cost-Optimized DevOps Project

A practical AWS DevOps project that demonstrates **Infrastructure as Code, containerization, CI/CD, AWS networking, monitoring, and automated application deployment** using Terraform, Docker, GitHub Actions, and AWS services.

The project is designed with a **cost-conscious approach**. The initial implementation uses EC2 and Docker instead of Amazon EKS. Kubernetes and EKS will be added later as an advanced phase.

---

## 📌 Project Overview

The objective of this project is to build and automate a small production-style AWS environment from the ground up.

Instead of manually creating AWS resources through the AWS Console, the infrastructure is provisioned using **Terraform** and maintained as code in GitHub.

The application is containerized using **Docker** and deployed to EC2 through a CI/CD pipeline using **GitHub Actions**.

### Main objectives

* Provision AWS infrastructure using Terraform
* Build a custom VPC and networking components
* Deploy an application on EC2
* Containerize the application using Docker
* Automate deployment using GitHub Actions
* Monitor infrastructure using CloudWatch
* Follow AWS security and cost-optimization practices
* Maintain infrastructure and application code in GitHub

---

# 🏗️ Architecture

### Current architecture

```text
                         Internet
                            |
                            |
                     +------+------+
                     |    AWS VPC   |
                     +------+------+
                            |
                  +---------+---------+
                  |                   |
             Public Subnet       Public Subnet
                  |                   |
                 EC2                 EC2
                  |                   |
                  +---------+---------+
                            |
                       Dockerized
                       Application
                            |
                       CloudWatch
                        Monitoring


Developer
    |
    | git push
    v
 GitHub Repository
    |
    v
GitHub Actions
    |
    +------------------+
    |                  |
    v                  v
Terraform          Docker Build
    |                  |
    v                  v
AWS Infrastructure   Application
                       |
                       v
                      EC2
```

> The architecture will be expanded gradually as additional components are implemented.

---

# 🛠️ Technology Stack

| Category               | Technology                          |
| ---------------------- | ----------------------------------- |
| Cloud                  | AWS                                 |
| Infrastructure as Code | Terraform                           |
| Compute                | Amazon EC2                          |
| Networking             | Amazon VPC                          |
| Containerization       | Docker                              |
| CI/CD                  | GitHub Actions                      |
| Source Control         | Git / GitHub                        |
| Monitoring             | Amazon CloudWatch                   |
| Operating System       | Amazon Linux                        |
| Database               | RDS MySQL — Planned                 |
| Load Balancing         | Application Load Balancer — Planned |
| Kubernetes             | Planned                             |
| EKS                    | Planned                             |

---

# 📁 Project Structure

```text
aws-cost-optimized-devops-project/
│
├── README.md
├── .gitignore
│
├── terraform/
│   │
│   ├── provider.tf
│   ├── versions.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── backend.tf
│   ├── terraform.tfvars.example
│   │
│   ├── environments/
│   │   ├── dev/
│   │   └── prod/
│   │
│   └── modules/
│       │
│       ├── vpc/
│       ├── subnets/
│       ├── internet-gateway/
│       ├── route-tables/
│       ├── security-groups/
│       ├── elastic_ip/
│       ├── iam/
│       ├── launch-template/
│       ├── bastion/
│       │
│       ├── alb/             # Planned
│       ├── autoscaling/     # Planned
│       ├── rds/             # Planned
│       └── cloudwatch/      # Planned
│
├── docker/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   └── .dockerignore
│
├── app/
│   └── application files
│
├── scripts/
│   ├── install-docker.sh
│   ├── deploy.sh
│   └── cleanup.sh
│
├── .github/
│   └── workflows/
│       ├── terraform.yml
│       └── deploy.yml
│
└── docs/
    ├── architecture.md
    ├── deployment.md
    ├── security.md
    └── troubleshooting.md
```

> The repository structure will evolve as the project progresses. Components marked **Planned** are not considered completed infrastructure.

---

# ☁️ AWS Infrastructure

## VPC

A custom VPC is created using Terraform.

The VPC provides the networking foundation for the application infrastructure.

### Components

* VPC
* Public subnets
* Private subnets
* Internet Gateway
* Route tables
* Route table associations
* Security groups

---

## 🌐 Subnets

The architecture separates resources based on their network requirements.

### Public Subnet

Used for resources that require controlled internet access.

Example:

* EC2 application instances
* Application Load Balancer — planned

### Private Subnet

Intended for internal resources that should not be directly accessible from the internet.

Example:

* Database
* Internal application components

---

# 🔐 Security

Security is implemented using AWS-native controls.

### Current approach

* IAM-based AWS access
* Security Groups
* Restricted inbound traffic
* Private subnets for internal resources
* No hard-coded credentials
* GitHub Secrets for CI/CD credentials where required
* `.gitignore` for sensitive files

### Security principles

* Least privilege
* Minimum required network access
* Avoid public access to databases
* Do not store credentials in Git
* Use IAM roles wherever possible

---

# 🏗️ Infrastructure as Code

Terraform is used to automate AWS infrastructure.

Instead of manually creating resources through the AWS Console:

```text
Terraform Code
      |
      v
terraform init
      |
      v
terraform validate
      |
      v
terraform plan
      |
      v
terraform apply
      |
      v
AWS Infrastructure
```

This provides:

* Repeatable infrastructure
* Version-controlled infrastructure
* Consistent deployments
* Easier changes
* Reduced manual configuration
* Automated cleanup

---

# 🚀 Terraform Commands

Navigate to the Terraform directory:

```bash
cd terraform
```

Initialize Terraform:

```bash
terraform init
```

Format Terraform files:

```bash
terraform fmt -recursive
```

Validate configuration:

```bash
terraform validate
```

Review planned changes:

```bash
terraform plan
```

Create infrastructure:

```bash
terraform apply
```

Destroy infrastructure when it is no longer required:

```bash
terraform destroy
```

View Terraform outputs:

```bash
terraform output
```

List resources managed by Terraform:

```bash
terraform state list
```

---

# 🐳 Docker

The application is containerized using Docker.

The deployment model is:

```text
Application Source Code
        |
        v
    Dockerfile
        |
        v
   Docker Image
        |
        v
 Docker Container
        |
        v
   Application
```

### Build Docker image

```bash
docker build -t aws-devops-app .
```

### Run container

```bash
docker run -d \
  --name aws-devops-app \
  -p 8080:8080 \
  aws-devops-app
```

### Check running containers

```bash
docker ps
```

### View container logs

```bash
docker logs aws-devops-app
```

### Stop container

```bash
docker stop aws-devops-app
```

### Remove container

```bash
docker rm aws-devops-app
```

---

# 🔄 CI/CD Pipeline

GitHub Actions is used to automate the development and deployment workflow.

### Pipeline

```text
Developer
    |
    | git push
    v
GitHub
    |
    v
GitHub Actions
    |
    +----------------------+
    |                      |
    v                      v
Terraform Validation    Docker Build
    |                      |
    v                      v
Terraform Plan         Application Image
                           |
                           v
                     EC2 Deployment
```

The pipeline will gradually be expanded to include:

* Terraform formatting
* Terraform validation
* Terraform plan
* Docker image build
* Application deployment
* Deployment verification

---

# 🔧 Git Workflow

The project uses Git for version control.

### Check status

```bash
git status
```

### Add changes

```bash
git add .
```

### Commit

```bash
git commit -m "Update Terraform infrastructure"
```

### Push

```bash
git push origin main
```

### Pull latest changes

```bash
git pull origin main
```

### View commit history

```bash
git log --oneline
```

---

# ☁️ AWS CLI

AWS CLI is used for verification and operational tasks.

Configure AWS CLI:

```bash
aws configure
```

Verify the current AWS identity:

```bash
aws sts get-caller-identity
```

Check configured region:

```bash
aws configure get region
```

List VPCs:

```bash
aws ec2 describe-vpcs
```

List subnets:

```bash
aws ec2 describe-subnets
```

List EC2 instances:

```bash
aws ec2 describe-instances
```

List S3 buckets:

```bash
aws s3 ls
```

---

# 🖥️ EC2 Deployment

EC2 provides the compute environment for the application.

The instance runs the Dockerized application.

Example deployment flow:

```text
EC2
 |
 +-- Amazon Linux
 |
 +-- Docker
 |
 +-- Application Container
 |
 +-- Application Port
```

After connecting to the EC2 instance:

```bash
docker --version
```

Check Docker service:

```bash
sudo systemctl status docker
```

Start Docker if required:

```bash
sudo systemctl start docker
```

Enable Docker at boot:

```bash
sudo systemctl enable docker
```

---

# 📊 Monitoring

Amazon CloudWatch is used for infrastructure monitoring.

Planned monitoring includes:

* EC2 CPU utilization
* EC2 status checks
* Application logs
* CloudWatch alarms
* Infrastructure health

Monitoring architecture:

```text
EC2
 |
 v
CloudWatch
 |
 +---- Metrics
 |
 +---- Logs
 |
 +---- Alarms
```

---

# 💰 Cost Optimization

Cost control is an important part of this project.

The initial architecture intentionally avoids expensive or unnecessary services.

### Not used initially

* Amazon EKS
* NAT Gateway
* Multi-AZ RDS
* Large EC2 instances
* Unnecessary managed services

### Cost-control practices

* Use Free Tier-eligible resources where applicable.
* Use small instance types for learning.
* Destroy temporary Terraform infrastructure.
* Avoid leaving RDS running unnecessarily.
* Avoid NAT Gateway during the initial phase.
* Monitor AWS billing.
* Configure AWS Budgets.
* Delete unused resources.

> AWS Free Tier eligibility and pricing can change, so current AWS pricing should always be checked before creating resources.

---

# 🔒 Sensitive Files

The following must never be committed to GitHub:

```text
AWS access keys
AWS secret keys
Private keys
.pem files
Terraform state
Passwords
Database credentials
.env files
```

Example `.gitignore`:

```gitignore
# Terraform
.terraform/
*.tfstate
*.tfstate.*
*.tfvars
*.tfvars.json

# AWS credentials
.aws/
*.pem

# Environment files
.env
.env.*

# Logs
*.log

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db
```

---

# 🧪 Validation and Testing

Before applying infrastructure:

```bash
terraform fmt -check -recursive
```

```bash
terraform validate
```

```bash
terraform plan
```

After deployment, verify AWS identity:

```bash
aws sts get-caller-identity
```

Verify VPC:

```bash
aws ec2 describe-vpcs
```

Verify EC2:

```bash
aws ec2 describe-instances
```

Verify Docker:

```bash
docker ps
```

Test the application locally on the EC2 instance:

```bash
curl http://localhost:8080
```

---

# 🧹 Cleanup

To remove Terraform-managed infrastructure:

```bash
terraform destroy
```

Review the resources before confirming destruction.

After cleanup, verify that no unnecessary billable resources remain in the AWS Console.

---

# 📈 Project Roadmap

## Phase 1 — AWS Foundation

* [ ] AWS account and billing configuration
* [ ] IAM configuration
* [ ] Terraform setup
* [ ] VPC
* [ ] Subnets
* [ ] Internet Gateway
* [ ] Route tables
* [ ] Security Groups

## Phase 2 — Compute and Application

* [ ] EC2
* [ ] IAM role for EC2
* [ ] Docker installation
* [ ] Application container
* [ ] Application deployment

## Phase 3 — CI/CD

* [ ] GitHub Actions
* [ ] Terraform validation
* [ ] Terraform plan
* [ ] Docker build
* [ ] Automated deployment
* [ ] Deployment verification

## Phase 4 — Monitoring

* [ ] CloudWatch metrics
* [ ] CloudWatch logs
* [ ] CloudWatch alarms

## Phase 5 — High Availability

* [ ] Application Load Balancer
* [ ] Multiple EC2 instances
* [ ] Auto Scaling Group
* [ ] Multi-AZ deployment

## Phase 6 — Database

* [ ] RDS MySQL
* [ ] Private database subnet
* [ ] Database security group
* [ ] EC2-to-RDS connectivity

## Phase 7 — Kubernetes

* [ ] Kubernetes fundamentals
* [ ] Minikube
* [ ] Deployments
* [ ] Services
* [ ] ConfigMaps
* [ ] Secrets
* [ ] Ingress
* [ ] EKS

---

# 🎯 Current Project Goal

The project is being developed incrementally.

The initial focus is:

```text
AWS
 +
Terraform
 +
Linux
 +
EC2
 +
Docker
 +
GitHub
 +
GitHub Actions
 +
CloudWatch
```

Once these components are working correctly, the architecture will be extended with:

```text
ALB
 +
Auto Scaling
 +
RDS
 +
Advanced Monitoring
 +
Kubernetes
 +
EKS
```

This approach keeps the initial project **simple, practical, cost-conscious, and easy to troubleshoot**.

---

# 💼 Resume Project Description

**AWS Cost-Optimized DevOps Infrastructure**

Automated AWS infrastructure using Terraform and implemented a containerized application deployment on EC2 using Docker. Configured AWS networking, security groups, GitHub-based source control, CI/CD automation using GitHub Actions, and CloudWatch monitoring while following Infrastructure as Code and cost-optimization practices.

---

# 🗣️ Interview Explanation

### Project Introduction

> I am building a cost-optimized AWS DevOps project where I provision infrastructure using Terraform and deploy a Dockerized application on EC2. I use GitHub for source control and GitHub Actions for CI/CD automation. I am also implementing CloudWatch for monitoring. I started with EC2 instead of EKS to understand the underlying AWS infrastructure and deployment process before moving to Kubernetes.

### Why Terraform?

> I use Terraform because it allows me to define AWS infrastructure as code. This makes the infrastructure repeatable, version controlled, and easier to maintain compared with manually creating resources through the AWS Console.

### Why Docker?

> I use Docker to package the application and its dependencies into a consistent container image. This makes the application easier to build, test, and deploy across environments.

### Why GitHub Actions?

> GitHub Actions automates the CI/CD workflow. Whenever code is pushed to the repository, the pipeline can validate the Terraform configuration, build the Docker image, and deploy the application.

### Why not EKS initially?

> I decided not to use EKS in the initial implementation because it adds additional cost and operational complexity. I first want to build a strong understanding of AWS networking, EC2, Docker, Terraform, and CI/CD. Kubernetes and EKS will be added as the next advanced phase.

---

# 👩‍💻 Author

**Geetha N**

AWS / DevOps Engineer

### Technologies

```text
AWS
Terraform
Docker
Git
GitHub
GitHub Actions
Linux
Bash
Python
CloudWatch
Kubernetes
Azure
```

---

## ⭐ Project Status

**Status:** In Development

**Primary Goal:** Build and automate a practical AWS DevOps environment with minimum unnecessary cloud cost.

**Current Focus:** Terraform + AWS VPC + EC2 + Docker + CI/CD

**EKS:** Planned for a later phase
