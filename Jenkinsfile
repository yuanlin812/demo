pipeline{
    agent any
    //定义仓库地址
    environment {
        REPOSITORY="https://github.com/yuanlin812/demo.git"
        hostpath="/opt/jenkins_maven_repository"
    }

    stages {

        stage('获取代码'){
            steps {
                echo "start fetch code from git:${REPOSITORY}"
                //清空当前目录
                deleteDir()
                //拉去代码    
                git "${REPOSITORY}"
            }
        }

        stage('代码静态检查'){
            steps {
                //伪代码检查
                echo "start code check"
            }
        }        

        stage('编译+单元测试'){
            steps {
                echo "start compile"
                sh 'mkdir -p ${hostpath}'
                sh 'docker pull registry.isspaas.com/library/maven:3.3-jdk-8'
                sh "docker.image('registry.isspaas.com/library/maven:3.3-jdk-8').inside('-v ${hostpath}:/root/.m2/repository')"
                sh 'mvn clean compile package'
            }
        }      
    }
}
