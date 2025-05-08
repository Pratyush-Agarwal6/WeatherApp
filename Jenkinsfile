pipeline {
    agent any
    
    environment {
        KUBECONFIG = "C:\\Users\\YourUserName\\.kube\\config" // Set your kubeconfig path here
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Deploy WeatherApp to Kubernetes') {
            steps {
                script {
                    // Ensure kubectl is installed and the Kubernetes context is set
                    sh 'kubectl config use-context docker-desktop'
                    
                    // Apply Kubernetes YAML files for deployment
                    sh '''
                        kubectl apply -f C:\\nginx\\nginx-1.27.4\\html\\WeatherApp\\deployment.yaml
                        kubectl apply -f C:\\nginx\\nginx-1.27.4\\html\\WeatherApp\\service.yaml
                        kubectl apply -f C:\\nginx\\nginx-1.27.4\\html\\WeatherApp\\jenkins-deployment.yaml
                        kubectl apply -f C:\\nginx\\nginx-1.27.4\\html\\WeatherApp\\jenkins-pv.yaml
                        kubectl apply -f C:\\nginx\\nginx-1.27.4\\html\\WeatherApp\\jenkins-pvc.yaml
                        kubectl apply -f C:\\nginx\\nginx-1.27.4\\html\\WeatherApp\\jenkins-service.yaml
                    '''
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Verify that the WeatherApp pods are running
                    sh 'kubectl get pods'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
