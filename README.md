# Simple Static Website Deployment Pipeline

A complete DevOps pipeline to deploy a static website using Docker, Jenkins, Kubernetes, and Ansible.

## 🚀 Quick Start

### Prerequisites
- Linux server or VM
- Git installed
- Internet connection

### 1. Clone Repository
```bash
git clone https://github.com/yourusername/static-website-pipeline.git
cd static-website-pipeline
```

### 2. Setup Infrastructure
```bash
# Make setup script executable
chmod +x setup.sh

# Run setup (installs Docker, Kubernetes, Jenkins, Ansible)
./setup.sh
```

### 3. Deploy Website
```bash
# Build and deploy
./deploy.sh
```

### 4. Access Website
- Website: `http://localhost:30080`
- Jenkins: `http://localhost:8080`

## 📁 Project Structure
```
├── README.md              # This file
├── setup.sh              # Infrastructure setup script
├── deploy.sh             # Deployment script
├── app/                  # Website files
│   ├── index.html
│   └── style.css
├── docker/
│   └── Dockerfile        # Container configuration
├── k8s/
│   ├── deployment.yaml   # Kubernetes deployment
│   └── service.yaml      # Kubernetes service
├── jenkins/
│   └── Jenkinsfile       # CI/CD pipeline
└── ansible/
    └── playbook.yml      # Server configuration
```

## 🛠️ What Each Tool Does

- **Docker**: Packages the website into a container
- **Kubernetes**: Manages and runs containers
- **Jenkins**: Automates building and deployment
- **Ansible**: Configures servers automatically

## 🔧 Customization

### Update Website
1. Edit files in `app/` folder
2. Run `./deploy.sh` to redeploy

### Change Port
Edit `k8s/service.yaml` and change `nodePort: 30080`

## 📝 Manual Commands

### Build Docker Image
```bash
docker build -t my-website:latest docker/
```

### Deploy to Kubernetes
```bash
kubectl apply -f k8s/
```

### Check Deployment Status
```bash
kubectl get pods
kubectl get services
```

## 🆘 Troubleshooting

### Website Not Loading
```bash
# Check if pods are running
kubectl get pods

# Check service
kubectl get svc
```

### Jenkins Not Starting
```bash
# Check Jenkins status
sudo systemctl status jenkins

# Start Jenkins
sudo systemctl start jenkins
```

## 📞 Support
If you encounter issues:
1. Check logs: `kubectl logs <pod-name>`
2. Verify services: `kubectl get all`
3. Restart deployment: `./deploy.sh`

---
**Made with ❤️ for learning DevOps**
