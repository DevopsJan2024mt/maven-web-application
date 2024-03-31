pipeline{
    agent any
    tools {
        maven "maven3.9.6"
    }
    stages{

    stage ('CheckOutCode'){
        steps {
            Sendslacknotifiacations("STARTED")
        git branch: 'development', credentialsId: '7e437f9e-49ab-4e9b-bdb9-095582644e43',
        url: 'https://github.com/DevopsJan2024mt/maven-web-application.git'
    }    }
    stage ('Build'){
        steps{
        sh "mvn clean package"
    }}
    /*
    stage ('ExecuteSonaqubeReport'){
        steps{
            sh "mvn clean sonar:sonar"
        }
    }
    stage ('UploadArtifactsIntoNexus'){
        steps{
            sh "mvn deploy"
        }
    }
    stage('DeployApplicationIntoTomcat'){
        steps{
            sshagent(['7ba01c0e-3478-4768-b315-8fd37f16eac4']) {
            sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@52.91.59.47:/opt/apache-tomcat-9.0.86/webapps/"
        }  }
    }
*/
    }//stages closing
    
    post {
  success {
     Sendslacknotifiacations(currentBuild.result)
  }
  failure {
     Sendslacknotifiacations(currentBuild.result)
  }
}
    
    }//pipeline closing
    
     def Sendslacknotifiacations(String buildStatus ) {
  // build status of null means successful
  buildStatus =  buildStatus ?: 'SUCCESS'

  // Default values
  def colorName = 'RED'
  def colorCode = '#FF0000'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary =  "${subject}(${env.BUILD_URL})"

  // Override default values based on build status
  if (buildStatus == 'STARTED') {
    color = 'YELLOW'
    colorCode = '#FFFF00'
  } else if (buildStatus == 'SUCCESS') {
    color = 'GREEN'
    colorCode = '#00FF00'
  } else {
    color = 'RED'
    colorCode = '#FF0000'
  }

  // Send notifications
  slackSend (color: colorCode, message: summary, channel : "citibank-project")
     }
    
    
