pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/Pratyush-Agarwal6/WeatherApp.git'  // Replace with your repo URL
        BRANCH = 'main'  // Set the branch name to main
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${GIT_REPO}", branch: "${BRANCH}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image for WeatherApp
                    echo 'Building Docker image for WeatherApp...'
                    sh 'docker build -t weatherapp:latest .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push Docker image to Docker Hub or another registry
                    echo 'Pushing Docker image to registry...'
                    sh 'docker push weatherapp:latest'
                }
            }
        }

        stage('Deploy WeatherApp to Kubernetes') {
            steps {
                script {
                    // Deploy to Kubernetes (apply the deployment yaml)
                    echo 'Deploying WeatherApp to Kubernetes...'
                    sh 'kubectl apply -f weatherapp-deployment.yaml'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Check if the pods are running and the service is available
                    echo 'Verifying Kubernetes deployment...'
                    sh 'kubectl get pods'
                    sh 'kubectl get svc'
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
