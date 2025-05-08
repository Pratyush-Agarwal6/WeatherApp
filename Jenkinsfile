pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/Pratyush-Agarwal6/WeatherApp.git'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${GIT_REPO}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image for WeatherApp
                    sh 'docker build -t weatherapp:latest .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push Docker image to Docker Hub or another registry
                    sh 'docker push weatherapp:latest'
                }
            }
        }

        stage('Deploy WeatherApp to Kubernetes') {
            steps {
                script {
                    // Deploy to Kubernetes (apply the deployment yaml)
                    sh 'kubectl apply -f weatherapp-deployment.yaml'
                }
            }
        }
    }

    post {
        success {
            echo '✅ WeatherApp deployed successfully.'
        }
        failure {
            echo '❌ Deployment failed.'
        }
    }
}
