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
        stage("rollback wiki") {
            steps {
                sh "helm rollback wiki -n bh"
            }
        }
    }
    post {
	       always { 
            cleanWs()
        }
    }
}
