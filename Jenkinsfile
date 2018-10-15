pipeline {
    agent { dockerfile true }
	environment {
				DOCKER_CREDS = credentials('jenkins-user-for-kinvitechcicd-docker')
			}
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
				sh "docker login -u $DOCKER_CREDS_USR -p $DOCKER_CREDS_PSW"
				sh "docker push kinvitechjenkinsimage:${env.BUILD_ID}"
            }
        }
    }
}