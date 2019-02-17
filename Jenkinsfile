pipeline {
    agent {
        docker {
            image 'docker:latest'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t lmydla/node-angular:latest .'
            }
        }
        stage('Push to registry') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_lmydla', passwordVariable: 'dockerpassword', usernameVariable: 'dockeruser')]) {
                    sh 'docker login -u ${dockeruser} -p ${dockerpassword}'
                    sh 'docker push lmydla/node-angular:latest'
                }
            }
        }
    }
}