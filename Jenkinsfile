pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIALS=credentials('mani-docker')
        
    }
    stages{
        stage('git clone'){
            steps{
               checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/manikumar9999/hello-world-1.git']]]) 
            }
        }
        stage('docker build'){
            steps{
                sh 'docker build -t manikumar99/k1234 .'
            }
        }
        stage('docker-login'){
            steps{
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
            }
            stage('docker push'){
                steps{
                    sh 'docker push manikumar99/k1234'
                }
            }
        stage('container creation'){
            steps{
               sh 'docker run -itd --name kumar123 -p 8080:8080 k1234'
    }
        }
    }
    post{
        always{
            sh 'docker logout'
        }
    }
}
