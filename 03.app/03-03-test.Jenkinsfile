pipeline {
  agent any
  stages {
        stage("download progect from github") {
            steps {
                git branch: 'master', url: 'https://github.com/shadejant/belhard-devops-fp.git' 
            }
        }
        stage("install .kube/config file") {
            steps {
                sh "cp 02.k3s/bh-k3s.yaml ~/.kube/config"
            }
        }
        stage("curl test") {
            steps {
                sh "sleep 30"
                sh "chmod +x 03.app/bin/smoketest.sh"
                sh "03.app/bin/smoketest.sh bh-k3s"
            }
        }
    }
    post { 
        failure {
            echo "test fail. rollback"
            sh "helm rollback wiki -n bh" 
        }
        always { 
            cleanWs()
            withCredentials([string(credentialsId: 'tel_secret', variable: 'TOKEN'),string(credentialsId: 'tel_chat_id', variable: 'CHAT_ID')]) {
                sh """
               curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode=markdown -d\
               text='Отчёт:\r
               *Project name :* ${currentBuild.projectName}\r
               *Version :* ${currentBuild.displayName}\r
               *Status :* ${currentBuild.result}'
               """
            }
        }
    }
}
