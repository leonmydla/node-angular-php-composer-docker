pipeline {
    agent {
        docker {
            label 'highUplink'
            image 'docker:latest'
        }
    }

    triggers {
        cron('H H * * *')
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker build --no-cache -t leonmydla/node-angular-php-composer:latest .'
            }
        }
        stage('Push to registry') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_leonmydla', passwordVariable: 'dockerpassword', usernameVariable: 'dockeruser')]) {
                    sh 'docker login -u ${dockeruser} -p ${dockerpassword}'
                }

                sh 'docker push leonmydla/node-angular-php-composer:latest'
                sh 'docker logout'
            }

            when {
                branch 'master'
            }
        }
    }
}
