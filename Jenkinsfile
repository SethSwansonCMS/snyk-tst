pipeline {
    agent {
        kubernetes {
            yaml '''
                apiVersion: v1
                kind: Pod
                spec:
                  serviceAccountName: leidos-mgmt
                  restartPolicy: Never
                  containers:
                    - name: python
                      image: python:3-alpine
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
// Testing scans
