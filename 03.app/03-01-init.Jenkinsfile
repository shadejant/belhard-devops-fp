pipeline {
  agent any
  stages {
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
