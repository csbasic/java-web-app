pipeline {

  agent { 
    label 'jenkins-agent' 
    }

  tools {
    jdk "Java17"
    maven 'Maven3'
  }

  // environment {
  //   APP_NAME = "java-web-app"
  //   RELEASE = "1.0.0"
  //   DOCKER_USER = "csbasic"
  //   DOCKER_PASS = 'spectraelectrification'
  //   IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
  //   IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
  //   JENKINS_API_TOKEN = credentials("JENKINS_API_TOKEN")
  
  // }

  stages {
    stage('Cleanup Workspace') {
      steps {
        cleanWs() 
      }
    }

    stage("Checkout from SCM"){
      steps {
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/csbasic/java-web-app.git'
      }

    }

    stage("Test Application"){
      steps {
        sh "mvn test"
      }
    }

    stage("Sonarqube Analysis"){
      steps {
        withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token') {
          sh "mvn sonar:sonar"
        }
      }
    }
  }  
}