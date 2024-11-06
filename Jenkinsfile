pipeline {
    agent any

    environment {
		DOCKERHUB_CREDENTIALS=credentials('Docker_Hub')
	}
    stages {
        stage('Docker Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Build & push Dockerfile') {
            steps {
                  sh '''
		       
		        docker stop laravel-container || true
		        docker rm laravel-container || true
		        docker rmi bassam2080/laravel-php || true
		        docker build -t bassam2080/laravel-php .
            docker compose up -d
		        docker push bassam2080/laravel-php
		        '''
            }
        }
        stage('Run Dockercompose playbook') {
            steps {
                sh """
                cd laravel-app
                ansible-playbook playbook-dcompose.yml 
                """
            }
        }
    }
}