pipeline{
      agent any
     stages{
        stage(download){
          steps{
           git 'https://github.com/baji2110951/maven.git'
          }
        }
         stage(build){
          steps{
           sh 'mvn package'   
           sh 'docker images'
          }
         }
           stage('create image'){
                 steps{
                  sh 'docker build -t baji21109/my:2.0 .'
                 }
           }
           stage('push image '){
                 steps{
                       withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                             sh "docker login -u baji21109 -p ${dockerHubPwd}"
                      }
                  sh 'docker push baji21109/my:2.0'     
                 }
           }
     }
}
