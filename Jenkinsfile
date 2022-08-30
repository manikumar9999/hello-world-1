pipeline {
    agent any
    environment{
        DOCKERHUB_CREDENTIALS=credentials('docker-hub')
    }
    tools{
        maven 'maven-3.8.6'
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
        stage('deploy'){
            steps{
                deploy adapters: [tomcat9(credentialsId: 'mk', path: '', url: 'http://34.201.116.17:8090/')], contextPath: null, war: '**/*.war'
            }
        }
        stage('docker build'){
            steps{
                sh 'docker build -t manikumar99/mnk .'
            }
        }
        stage('docker-login'){
            steps{
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
            }
            stage('docker push'){
                steps{
                    sh 'docker push manikumar99/mnk'
                }
            }
            stage('docker-container'){
                steps{
                    sh 'docker run -itd --name i8112 -p 90:80 manikumar99/mnk'
                }
            }
    }
    post{
        always{
            sh 'docker logout'
        }
    }
    
}
