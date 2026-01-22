Dockerized Python Application on AWS EC2 (Terraform Cloud + GitHub)
📌 Project Overview

This project demonstrates a VCS-driven Infrastructure as Code workflow where an EC2 instance is provisioned using Terraform Cloud, triggered automatically by GitHub pushes, and a Dockerized Python Flask application is deployed and run on the instance.

The EC2 instance is bootstrapped using user data to install Docker at launch, following real-world DevOps practices.

🏗️ Architecture
GitHub Repository (VCS)
        │
        ├── Terraform Code Push
        │
Terraform Cloud
        │
        ├── Workspace (VCS-driven)
        ├── Remote State Management
        └── Remote Runs
        │
AWS EC2
        │
        ├── User Data (Docker Installation)
        └── Docker Container (Flask App)

🛠️ Tech Stack

Cloud Provider: AWS

Infrastructure as Code: Terraform

Terraform Execution: Terraform Cloud (VCS-Driven)

Version Control: GitHub

Compute: Amazon EC2

Containerization: Docker

Backend: Python (Flask)

OS: Amazon Linux 2023

📂 Repository Structure
First_Docker_Project/
│
│── main.tf
│── variables.tf
│── outputs.tf
│── user_data.sh
│
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
│
└── README.md

⚙️ Terraform Cloud Setup
✔️ Workspace Configuration

Workspace type: VCS-driven

GitHub repository connected to Terraform Cloud

AWS credentials stored securely as Terraform Cloud variables

Remote state managed automatically by Terraform Cloud

✔️ Trigger Mechanism

Any push to the GitHub repository triggers:

terraform plan

Manual approval

terraform apply in Terraform Cloud

🖥️ EC2 Provisioning (Terraform)

Terraform provisions:

EC2 instance

Security Group (SSH + application port)

Key pair (for SSH access)

User data script for Docker installation

🐳 Docker Installation via User Data

Docker is installed automatically during EC2 launch, before any SSH access.

yum update -y
yum install docker -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user


This ensures:

Docker is available immediately

No manual post-login setup is required

🐍 Python Flask Application

The Flask app exposes simple endpoints:

/ → Health check

/time → Returns server UTC time

@app.route("/")
def home():
    return "Hello from Docker running on EC2!"

📦 Dockerfile Highlights

Uses python:3.10-slim base image

Installs dependencies using requirements.txt

Copies application code

Exposes port 5000

Runs Flask application inside container

▶️ Application Deployment Flow
1️⃣ Infrastructure Deployment

Push Terraform code to GitHub

Terraform Cloud automatically runs plan and apply

EC2 instance is created and Docker is installed via user data

2️⃣ Application Deployment

SSH into EC2

Clone GitHub repository

Build Docker image

Run Flask container

docker build -t first-docker-app .
docker run -p 80:80 first-docker-app

🌐 Accessing the Application
http://<EC2_PUBLIC_IP>:80
http://<EC2_PUBLIC_IP>:80/time

🔐 Security & Best Practices

No AWS credentials committed to GitHub

Terraform Cloud variable sets used for secrets

Infrastructure changes controlled via VCS

Immutable server bootstrapping via user data

💡 Key Learnings

VCS-driven Terraform Cloud workflows

Remote Terraform execution and state management

EC2 provisioning with automated bootstrapping

Docker containerization on cloud infrastructure

Secure cloud-native deployment practices

📈 Future Improvements

Automate container startup via user data

Push Docker image to Amazon ECR

Add Load Balancer

Implement HTTPS

Migrate to ECS / EKS

👩‍💻 Author

Suhani Sharma
AWS Certified Solutions Architect – Associate
Aspiring Cloud / DevOps Engineer
