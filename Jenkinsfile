#!groovy
pipeline{
    agent any
    //定义仓库地址
    environment {
        REPOSITORY="https://github.com/yuanlin812/demo.git"
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
                sh 'mvn -Dmaven.test.skip=true -U clean install'
                }
            }
        }      
    }
}