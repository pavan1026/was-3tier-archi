pipeline {
    agent any
    parameters {
                choice choices: ['apply', 'destroy'], description: 'this parameter is to create and destroy infrastructure on AWS', name: 'terraform-action'
            }

    stages {
        stage('git checkout') {
            steps {
               git branch: 'main', url: 'https://github.com/pavan1026/was-3tier-archi.git'
            }
        }
    
        stage('Terraform init') {
            steps {
               sh 'terraform init'
            }
        }
    
        stage('Terraform plan') {
            steps {
               sh 'terraform plan'
            }
        }
    
        stage('Terraform apply or destroy') {
            steps {
               sh 'terraform ${terraform} --auto-approve'
            }
        }
    }
}
