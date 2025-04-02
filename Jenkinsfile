pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/Pratyush-Agarwal6/WeatherApp.git'
            }
        }

        stage('Deploy to NGINX') {
            steps {
                echo 'Deploying WeatherApp to NGINX...'
                sh '''
                sudo systemctl stop nginx
                sudo rm -rf /usr/share/nginx/html/*
                sudo cp -r * /usr/share/nginx/html/
                sudo systemctl start nginx
                '''
            }
        }
    }
}
