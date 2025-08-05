pipeline {
    agent any

    environment {
        IMAGE_NAME = 'technovaaa'
        CONTAINER_NAME = 'technovaaa-running'
        PORT = '3000'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/reshavgovindam/technova.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Trivy Security Scan') {
            steps {
                script {
                    sh '''
                        echo "Running Trivy scan..."
                        trivy image --severity HIGH,CRITICAL --no-progress -f table -o trivy-report.txt ${IMAGE_NAME} || true
                        cat trivy-report.txt
                        }
                 }
         }

        stage('Deploy') {
            steps {
                script {
                    sh "docker rm -f ${CONTAINER_NAME} || echo 'No container to remove'"
                    sh "docker run -d -p ${PORT}:${PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        failure {
            echo "Build failed! Check logs for details."
        }
        success {
            echo "Build and deployment succeeded!"
        }
    }
}

