pipeline {
  agent any
  stages {
        stage("download progect from github") {
            steps {
                git branch: 'master', url: 'https://github.com/shadejant/belhard-devops-fp.git' 
            }
        }
        stage("use-context bh-k3s") {
            steps {
                sh "kubectl config use-context bh-k3s"
            }
        }
        stage("create ns") {
            steps {
                sh "kubectl create namespace bh"
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}