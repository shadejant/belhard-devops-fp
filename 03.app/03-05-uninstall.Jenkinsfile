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
        stage("uninsatll wiki") {
            steps {
                sh "helm uninstall wiki -n bh"
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
