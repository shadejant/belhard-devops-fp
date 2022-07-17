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
        stage("insatll wiki") {
            steps {
                sh "helm install wiki 03.app/wiki/ --values 03.app/wiki/values.yaml -n bh"
            }
        }
    }
    post { 
        always { 
            cleanWs()
			sh "rm ~/.kube/config"
        }
    }
}
