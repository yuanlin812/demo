pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Checkout..'    
            }
        }
        stage('Package') { 
            steps {
                mvn {
                    isPublishJunit = "true" ,
                    settingsPath = "" ,
                    text = "maven构建" ,
                    pomPath = "pom.xml" ,
                    name = "maven构建" ,
                    goals = "compile" ,
                    mvnVersion = "3.3-jdk-8" ,
                    type = "mvn" ,
                    order = "1" ,
                    isPublishJavadoc = "true" 
                }
                echo 'Packageing..'
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