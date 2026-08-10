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

                sh 'docker build -t ${JOB_NAME}:v1.${BUILD_NUMBER} .'
            }
        }
 
    }
}