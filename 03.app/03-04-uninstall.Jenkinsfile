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
        stage("destoy wiki") {
            steps {
                sh "kubectl delete namespace bh"
            }
        }
    }
    post { 
        always { 
            cleanWs()
            sh "rm ~/.kube/config"
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
