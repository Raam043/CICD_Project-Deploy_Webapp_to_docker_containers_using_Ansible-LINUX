pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Raam043/CICD_Project-Deploy_Webapp_to_docker_containers_using_Ansible-LINUX.git'
            }
        }
        stage('Docker Installation on Nodes') {
            steps {
                ansiblePlaybook credentialsId: 'Ansi', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'nodes.inv', playbook: 'docker_installation.yml'
            }
        }
        stage('Docker Image Pull') {
            steps {
                ansiblePlaybook credentialsId: 'Ansi', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'nodes.inv', playbook: 'httpd_Image.yml'
            }
        }
        stage('Docker Image Build') {
            steps {
                sh 'docker build -t raam043/httpdimage:latest'
            }
        }
        stage('Docker Container Run') {
            steps {
                ansiblePlaybook credentialsId: 'Ansi', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'nodes.inv', playbook: 'httpd_Container.yml'
            }
        }
        stage('Docker Push to Registry') {
            steps {
                withCredentials([string(credentialsId: 'Docker-hub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u raam043 -p ${dockerhubpwd}'
                    sh 'docker push raam043/httpdimage'
}
            }
        }
    }
}
