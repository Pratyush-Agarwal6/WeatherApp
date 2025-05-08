pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/your-username/your-weatherapp-repo.git'
        TERRAFORM_DIR = 'terraform'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${GIT_REPO}"
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Deploy WeatherApp') {
            steps {
                sh 'echo "Deployed to Kubernetes NGINX via Terraform"'
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
