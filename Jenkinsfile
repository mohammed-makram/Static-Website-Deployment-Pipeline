pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t my-website:latest docker/'
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'minikube image load my-website:latest'
                    sh 'kubectl apply -f k8s/deployment.yaml'
                    sh 'kubectl apply -f k8s/service.yaml'
                }
            }
        }
        
        stage('Verify Deployment') {
            steps {
                script {
                    sh 'kubectl wait --for=condition=available --timeout=300s deployment/website-deployment'
                    sh 'kubectl get pods'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Deployment successful! '
        }
        failure {
            echo 'Deployment failed! '
        }
    }
}
