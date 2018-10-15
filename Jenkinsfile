pipeline {
    agent { dockerfile true }
	stages {
        stage('Build') {
            steps {
				sh "docker build -t kinvitechjenkinsimage:${env.BUILD_ID} ."
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
				sh "docker push kinvitechjenkinsimage:${env.BUILD_ID}"
            }
        }
    }
}