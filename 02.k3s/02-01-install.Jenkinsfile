pipeline {
  agent any
  stages {
        stage("download progect from github") {
            steps {
                git branch: 'master', url: 'git@github.com:shadejant/belhard-devops-fp.git' 
            }
        }
        stage("ansible playbook") {
            steps {
                sh "ansible-playbook -i 02.k3s/inventory/hosts 02.k3s/playbooks/main.yml" 
            }
        }
        stage("modify bh-k3s.yaml") {
            steps {
                sh "sed -i -e 's/127.0.0.1/bh-k3s/g' 02.k3s/bh-k3s.yaml"
                sh "git add --all"
                sh 'git commit -m "modify bh-k3s.yaml"'
                sh "git push origin master"
            }
        }
    }
    post { 
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
