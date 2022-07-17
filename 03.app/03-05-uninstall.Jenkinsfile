pipeline {
  agent any
  stages {
        stage("use-context bh-k3s") {
            steps {
                sh "kubectl config use-context bh-k3s"
            }
        }
        stage("uninsatll wiki") {
            steps {
                sh "helm uninstall wiki -n bh"
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}
