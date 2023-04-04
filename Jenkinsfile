pipeline {
    agent {
        kubernetes {
            yaml '''
                apiVersion: v1
                kind: Pod
                spec:
                  serviceAccountName: jenkins-role
                  restartPolicy: Never
                  containers:
                    - name: python
                      image: python:3.11-alpine3.17
                      command: ['cat']
                      tty: true
                    - name: awscli
                      image: amazon/aws-cli
                      command: ['cat']
                      tty: true
            '''
	    }
    }

    stages {
        stage("build"){
            steps {
                container("python"){
                    sh '''
                    echo "Doing something"
                    '''
                }
            }
        }
    }
}

