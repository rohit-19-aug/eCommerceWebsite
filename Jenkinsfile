pipeline {
  agent any
  tools {
    maven '3.6.3' 
  }
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean package'
      }
    }
    stage ('Testing') {
      steps {
      sh 'mvn test' 
        }
      }
    stage ('Deploy') {
      steps {
        script {
          deploy adapters: [tomcat9(credentialsId: 'MyTomCat1', url: 'http://3.25.114.37:8080/')], contextPath: '', onFailure: false, war: 'target/*.war' 
        }
      }
    }
  }
  post{
        success{
            mail to: "rohit.vishwakarma@knoldus.com",
            subject: "Build is successfull",
            body: "success"
        }
    failure{
      mail to: "rohit.vishwakarma@knoldus.com",
            subject: "Build is failed",
            body: "failed"
    }
  }
}
