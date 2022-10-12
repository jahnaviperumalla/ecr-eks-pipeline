pipeline {
    agent any
    environment {
        registry = "882956824445.dkr.ecr.us-west-2.amazonaws.com/harish-cicd-pipeline"
    }
   
    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jahnaviperumalla/ecr-eks-pipeline.git']]])
           }
       }
       
       stage('docker image') {
           steps{
              script {
                  dockerImage = docker.build registry 
               }
            }
        }
        
        stage('docker image push') {
            steps {  
              script {
                sh 'aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 882956824445.dkr.ecr.us-west-2.amazonaws.com'
                sh 'docker push 882956824445.dkr.ecr.us-west-2.amazonaws.com/harish-cicd-pipeline:latest'
               }
           }   
        }
        
        stage('k8s deployment') {
            steps {  
              script {
                  withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8s', namespace: '', serverUrl: '') {
                   sh 'kubectl apply -f  deployment.yml'
                    }