pipeline{
    agent any
    //定义仓库地址
    environment {
        REPOSITORY="https://github.com/yuanlin812/demo.git"
        hostpath="/opt/jenkins_maven_repository"
        dockerFilePath='.'
        name='yd0509/hello'
    }

    stages {

        stage('checkout'){
            steps {
                echo "start fetch code from git:${REPOSITORY}"
                //清空当前目录
                deleteDir()
                //拉取代码    
                git "${REPOSITORY}"
            }
        }   

        stage('maven构建'){
            steps {
                echo "start compile"
                sh 'mvn clean compile package'
            }
        }   

        stage('构建docker镜像'){
            steps {
                echo "start buildDocker"
                sh 'docker build -t HelloWorld .'
            }
        }    
    }
}
