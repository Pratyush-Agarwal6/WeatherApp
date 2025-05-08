pipeline {
    agent any

    environment {
        K8S_CONFIG = '/path/to/your/kubeconfig' // Set this path if needed
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone your repository
                git 'https://github.com/Pratyush-Agarwal6/WeatherApp.git'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Apply the Kubernetes deployment (assuming you have your YAML files for deployment)
                    sh '''
                    kubectl --kubeconfig=${K8S_CONFIG} apply -f kubernetes/deployment.yaml
                    kubectl --kubeconfig=${K8S_CONFIG} apply -f kubernetes/service.yaml
                    '''
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    // Verify that the WeatherApp is running in the Kubernetes cluster
                    sh 'kubectl --kubeconfig=${K8S_CONFIG} get pods'
                }
            }
        }
    }
    post {
        always {
            // Notify about the status of the pipeline (Success or Failure)
            echo "Pipeline finished."
        }
    }
}
