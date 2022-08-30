pipeline{
    agent any
    tools{
        maven 'maven-3.8.6'
    }
    environment{
    DOCKERHUB_CRDENTIALS=credentials('docker-hub')
    }
    stages{
        stage('git'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/manikumar9999/hello-world-1.git']]])
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean install package'
            }
        }
        stage('docker-build'){
            steps{
                sh 'docker build -t mnk .'
            }
        }
        stage('docker-login'){
            steps{
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('docker-push'){
            steps{
                sh 'docker push manikumar99/mnk'
            }
        }
        stage('docker-container'){
            steps{
                sh 'docker run -it --name ml -p 86:80 -d mnk'
            }
        }
    }
    post{
        always{
            sh 'docker logout'
        }
    }
}
