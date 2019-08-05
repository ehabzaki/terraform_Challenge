pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {

        stage('terraform started') {
            steps {
                sh 'echo "Started...!"'
                sh 'if [ "$(sudo docker ps -aq)" ]; then sudo docker rm -f $(sudo docker ps -aq) fi'

            }
        }
        stage('git clone') {
            steps {
                sh 'sudo rm -r *;sudo git clone https://github.com/ehabzaki/terraform_Challenge.git'
         
            }
        }
     
        stage('terraform init') {
            steps {
               sh 'sudo docker run  -v $(pwd)/terraform_Challenge:/workpace -v /var/run/docker.sock:/var/run/docker.sock -w /workpace hashicorp/terraform:full init -input=false'

            }
        }
        stage('terraform plan') {
            steps {
                sh 'sudo docker run  -v $(pwd)/terraform_Challenge:/workpace -v /var/run/docker.sock:/var/run/docker.sock -w /workpace hashicorp/terraform:full plan -input=false'

            }
        }
        stage('terraform ended') {
            steps {
                  sh 'sudo docker run  -v $(pwd)/terraform_Challenge:/workpace -v /var/run/docker.sock:/var/run/docker.sock -w /workpace hashicorp/terraform:full  apply -input=false -auto-approve'

                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
