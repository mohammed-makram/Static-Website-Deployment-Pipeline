#!/bin/bash

echo " Setting up DevOps Pipeline..."

# Update system
sudo apt update -y

# Install Docker
echo " Installing Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Install Kubernetes (minikube)
echo "Installing Kubernetes..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Install Jenkins
echo " Installing Jenkins..."
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y openjdk-11-jdk jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Install Ansible
echo " Installing Ansible..."
sudo apt install -y ansible

# Start minikube
echo " Starting Minikube..."
minikube start --driver=docker

echo " Setup Complete!"
echo " Access Jenkins at: http://localhost:8080"
echo " Jenkins initial password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo ""
echo " Next steps:"
echo "1. Run: ./deploy.sh"
echo "2. Visit: http://localhost:30080"
