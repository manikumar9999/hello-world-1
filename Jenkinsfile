pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIALS=credentials('mani123')
    }
    tools{
        maven 'maven-3.9.4'
    }
    stages{
        stage('git clone'){
            steps{
               checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/manikumar9999/hello-world-1.git']]]) 
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean install package'
            }
        }
       
        stage('docker build'){
            steps{
                sh 'docker build -t mr .'
            }
        }
        stage('docker-login'){
            steps{
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
            }
            stage('docker push'){
                steps{
                    sh 'docker push manikumar99/mr'
                }
            }
            stage('docker-container'){
                steps{
                    sh 'docker run -itd --name i81121112 -p 802:80 manikumar99/mr'
                }
            }
    }
   
    
}
