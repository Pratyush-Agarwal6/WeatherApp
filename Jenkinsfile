pipeline {
    agent any

    stages {
        stage('Check Docker') {
            steps {
                echo '🔍 Checking if Docker is accessible...'
                sh 'where docker || echo Docker NOT found'
                sh 'docker --version || echo Docker CLI not working'
            }
        }

        stage('Clone Repository') {
            steps {
                git 'https://github.com/Pratyush-Agarwal6/WeatherApp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image for WeatherApp...'
                sh 'docker build -t weatherapp:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image...'
                // Add DockerHub login/push commands here if needed
            }
        }

        stage('Deploy WeatherApp to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes...'
                // kubectl apply -f deployment.yaml or similar
            }
        }

        stage('Verify Deployment') {
            steps {
                echo 'Verifying Kubernetes Deployment...'
                // kubectl rollout status etc.
            }
        }
    }

    post {
        failure {
            echo '❌ Deployment failed.'
        }
    }
}
