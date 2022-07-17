pipeline {
  agent any
  stages {
        stage("use-context bh-k3s") {
            steps {
                sh "kubectl config use-context bh-k3s"
            }
        }
        stage("destoy wiki") {
            steps {
                sh "kubectl delete pvc data-wiki-postgresql-0 -n bh"
		sh "kubectl delete namespace bh"
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}
