pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
    }
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Bhargavkulla/HelloWorld-Java.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t bhargavakulla/helloworld-java:v1 .'
            }
        }
        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker push bhargavakulla/helloworld-java:v1
                    '''
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl applyf -f service.yaml'
        }
    }
    }
}
