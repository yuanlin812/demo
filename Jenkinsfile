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
                def mversion = "${config.mvnVersion}"
                if(mversion==null||mversion=='') mversion = 'latest'
                docker.withRegistry('http://registry.isspaas.com','registry_isspaas'){
                    def pull ="docker pull registry.isspaas.com/library/maven:${mversion}"
                    sh pull
                }
                def goal = getGoal(config)
                sh "mvn ${goal}"
                if(Boolean.parseBoolean(config.isPublishJavadoc)){
                    archive {
                        artifacts = 'target/*-javadoc.jar'
                        allowEmptyArchive = 'false'
                        onlyIfSuccessful = 'true'
                        fingerprint = 'false'
                        defaultExcludes = 'true'
                        caseSensitive = 'true'
                     }
                }
                if(Boolean.parseBoolean(config.isPublishJunit)){
                    archive {
                        artifacts = 'target/site/surefire-report.html'
                        allowEmptyArchive = 'false'
                        onlyIfSuccessful = 'true'
                        fingerprint = 'false'
                        defaultExcludes = 'true'
                        caseSensitive = 'true'
                     }
                }
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