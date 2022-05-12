pipeline{
agent any
tools{
maven 'maven-3.8.5'
}
stages{
stage('gitclone'){
steps{
git 'https://github.com/manikumar9999/lopk.git'
}
}
stage('mvn'){
steps{
sh 'mvn clean install package'
}
}
}
}
