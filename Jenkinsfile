pipeline {
    agent any

    environment {
        KUBECONFIG = "C:\\Users\\91809\\.kube\\config"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                echo 'Checking out Git repository...'
                git branch: 'main', url: 'https://github.com/Pratyush-Agarwal6/WeatherApp.git'
            }
        }

        stage('Check Kubernetes') {
            steps {
                echo 'Checking if Kubernetes is accessible...'
                sh 'kubectl version --client'
                sh 'kubectl get pods'
            }
        }

        stage('Deploy WeatherApp to Kubernetes') {
            steps {
                echo 'Deploying WeatherApp to Kubernetes...'
                sh 'kubectl apply -f C:\\nginx\\nginx-1.27.4\\html\\WeatherApp\\deployment.yaml'
                sh 'kubectl apply -f C:\\nginx\\nginx-1.27.4\\html\\WeatherApp\\service.yaml'
            }
        }

        stage('Verify Deployment') {
            steps {
                echo 'Verifying the Kubernetes deployment...'
                sh 'kubectl get deployments'
                sh 'kubectl get pods'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
