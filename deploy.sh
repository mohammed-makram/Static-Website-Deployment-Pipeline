#!/bin/bash

echo " Deploying Static Website..."

# Build Docker image
echo " Building Docker image..."
docker build -t my-website:latest -f docker/Dockerfile .

# Load image to minikube
echo " Loading image to Kubernetes..."
minikube image load my-website:latest

# Deploy to Kubernetes
echo " Deploying to Kubernetes..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# Wait for deployment
echo " Waiting for deployment..."
kubectl wait --for=condition=available --timeout=300s deployment/website-deployment

# Get service URL
echo " Getting service URL..."
minikube service website-service --url

echo " Deployment Complete!"
echo " Website available at: http://localhost:30080"
echo " Check status: kubectl get pods"
