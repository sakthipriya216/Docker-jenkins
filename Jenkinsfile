pipeline
{
    agent any
    
        stages
        {
            stage('Docker login..')
            {
                steps
                {
                    withDockerRegistry(credentialsId: 'Jenkins-Docker',  url: 'https://index.docker.io/v1/')
                    {
                        sh 'echo "Login sucess!!!.."'
                    }
                }
                
            }

            stage('Docker build..')
            {
                steps
                {
                    sh 'docker build . -t sakthisanjay2119/alpine_nginx'
                }
            }

            stage('Docker push')
            {
                steps
                {
                    sh 'docker push sakthisanjay2119/alpine_nginx'
                }
            }

            stage('Docker container.')
            {
                steps
                {
                    sh 'docker run --name alpine_container -p 8015:8080 sakthisanjay2119/alpine_nginx'
                }
            }
            stage('Finish..')
            {
                steps
                {
                    sh 'echo Completed'
                }
            }
        }
    
}
