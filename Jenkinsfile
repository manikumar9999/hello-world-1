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
                sh 'docker build -t manikumar99/mnkk .'
            }
        }
        stage('docker-login'){
            steps{
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
            }
            stage('docker push'){
                steps{
                    sh 'docker push manikumar99/mnnk'
                }
            }
            stage('docker-container'){
                steps{
                    sh 'docker run -itd --name i8112112 -p 801:80 manikumar99/mnnk'
                }
            }
    }
   
    
}
