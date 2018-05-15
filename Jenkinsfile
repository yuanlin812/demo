pipeline{
    agent any
    //定义仓库地址
    environment {
        REPOSITORY="https://github.com/yuanlin812/demo.git"
    }
    def mvnHome = tool 'M2_HOmE'
    env.PATH = "${mvnHome}/bin:${env.PATH}"
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
                sh 'docker build -t hellosprintboot .'
                //登录镜像仓库
                //pushdocker镜像

            }
        }    
    }
}
