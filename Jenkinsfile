pipeline {

    agent any 

    stages {

        stage ('Checkout') {

            steps {

               checkout scm
            }
        }
        
        stage ('docker image') {

            steps {
                
                sh '''

                 docker build -t ${JOB_NAME}:v1.${BUILD_NUMBER} .
                 docker tag ${JOB_NAME}:v1.${BUILD_NUMBER} neeraj91/${JOB_NAME}:v1.${BUILD_NUMBER} 
                 docker tag ${JOB_NAME}:v1.${BUILD_NUMBER} neeraj91/${JOB_NAME}:latest
                
                '''
            }
        }

        stage ('docker push')

        steps {

            script{

                withCredentials([usernamePassword(credentialsId: 'github-credentials', passwordVariable: 'DOCKERVARS', usernameVariable: 'DOCKERNAME')]) {

                    sh 'docker push neeraj91/${JOB_NAME}:v1.${BUILD_NUMBER}'
                    sh 'docker push neeraj91/${JOB_NAME}:latest'
            }
        }
 
    }
}