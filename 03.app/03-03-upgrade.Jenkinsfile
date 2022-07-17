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
        stage("upgrade wiki") {
            steps {
                sh "helm upgrade wiki 03.app/wiki/ --values 03.app/wiki/values.yaml -n bh"
            }
        }
        stage("test") {
            steps {
                sh "curl http://bh-k3s"
            }
        }
    }
    post { 
        failure { 
            sh "helm rollback wiki -n bh"
        }
		always { 
            cleanWs()
        }
    }
}