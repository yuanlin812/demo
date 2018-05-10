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
                echo 'Package..'
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

withEnv(["JAVA_HOME=${tool name: 'jdk1.8'}"]) {
     
     step([$class: 'ArtifactArchiver', artifacts: 'target/donuts-container.war', fingerprint: true])
     dir('target') {
       stash name: 'war', includes: 'donuts-container.war'
     }
   }