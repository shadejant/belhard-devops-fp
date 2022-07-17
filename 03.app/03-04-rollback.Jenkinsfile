pipeline {
  agent any
  stages {
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
