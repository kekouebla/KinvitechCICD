pipeline {
    agent {
		dockerfile {
			registryUrl 'https://registry.hub.docker.com/kinvitech/kinvitechcicd/'
			registryCredentialsId 'jenkins-user-for-kinvitechcicd-docker'
		}	
	}
	stages {
        stage('Build') {
            steps {
				sh "docker build -t kinvitechjenkinsimage.${env.BUILD_ID} ."
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
			environment {
				DOCKER_CREDS = credentials('jenkins-user-for-kinvitechcicd-docker')
			}
            steps {
				withDockerRegistry([credentialsId: "jenkins-user-for-kinvitechcicd-docker", url: "https://registry.hub.docker.com/kinvitech"]) {
					sh "docker login -u $DOCKER_CREDS_USR -p $DOCKER_CREDS_PSW"
					sh "docker tag kinvitechjenkinsimage kinvitech/kinvitechcicd:kinvitechjenkinsimage.${env.BUILD_ID}"
					sh "docker push kinvitech/kinvitechcicd:kinvitechjenkinsimage.${env.BUILD_ID}"
				}
            }
        }
    }
}