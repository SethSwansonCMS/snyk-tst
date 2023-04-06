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
                    - name: snyk
                      image: snyk/snyk:alpine
                      command: ['cat']
                      tty: true
            '''
	    }
    }

    environment {
      SNYK_TOKEN = credentials('jenkins-snyk')
    }

    stages {
        stage("SnykTest") {
          container("snyk") {
            sh '''
            cd _terraform && \
            snyk iac test --severity-threshold=low --report \
            --target-name=snyk-cli-tst --org="bdclmdc-etc-bdclmdc-etc"
            '''
          }
        }
    }
}
