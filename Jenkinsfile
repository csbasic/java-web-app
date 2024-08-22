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
  //   DOCKER_PASS = 'jenkins-docker-token'
  //   IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
  //   IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
  //   // JENKINS_API_TOKEN = credentials("JENKINS_API_TOKEN")
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

    stage("Application Testing"){
      steps {
        sh "mvn test"
      }
    }

    stage("File System Scan"){
      steps {
        sh "File System Scan"
      }
    }

    stage("Sonarqube Analysis"){
      steps {
        sh "Sonarqube analysis"
      }
    }

    stage("Quality Gate") {
      steps {
        sh "Quality Gate"
      }
    }

    stage("Build"){
      steps {
        sh "Build Stage"
      }
    }

    stage("Publish To Nexus") {
      steps {
        sh "Store and distribute artifact"
      }
    }

    stage("Build & Tag Docker Image"){
      steps {
        sh "Build a docker image image with a tag"
      }
    }

    stage("Docker Image Scan"){
      steps {
        sh "Scan docker image"
      }
    }

    stage("Push Docker Image"){
      steps {
        sh "Publishing docker image to registry"
      }
    }

    stage("Deploy To Kubernetes"){
      steps {
        sh "Deploy containers to kubernetes"
      }
    }

    stage("Verify Deployment"){
      steps {
        sh "Check if everything is ok with deployment"
      }
    }

    stage("Declarative Post Actions"){
      steps {
        sh "Finalize the project"
      }
    }
  }  
}