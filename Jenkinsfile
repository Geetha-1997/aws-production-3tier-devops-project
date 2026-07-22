pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('app') {
                    bat 'npm install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('app') {
                    bat 'docker build -t production-app:v1 .'
                }
            }
        }

        stage('Verify Docker Image') {
            steps {
                bat 'docker images'
            }
        }
    }
}