pipeline {
    agent any

    stages {
        stage('checkout') {
             steps {
                 check {
                    scm = 'git' 
                    name = '代码检出' 
                    url = 'git@github.com:yuanlin812/demo.git' 
                    text = '代码检出' 
                    credentialsName = 'yuanlin-demo-github' 
                    credentialsId = 'a9bcfebe-feb7-45da-9f78-6919bcca9204' 
                    branch = 'master' 
                    type = 'check' 
                    order = '1' 
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}