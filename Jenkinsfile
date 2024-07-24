pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIALS=credentials('mani143')
    }
    tools{
        maven 'maven'
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
                sh 'docker build -t mk09 .'
            }
        }
        stage('docker-login'){
            steps{
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
            }
            stage('docker push'){
                steps{
                    sh 'docker push manikumar99/mk09'
                }
            }
            stage('docker-container'){
                steps{
                    sh 'docker run -itd --name i8 -p 808:80 manikumar99/mk09'
                }
            }
    }
   
    
}
