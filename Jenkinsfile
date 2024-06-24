pipeline
{
    agent any
    
        stages
        {

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
                    withDockerRegistry(credentialsId: 'Jenkins-Docker',  url: 'https://index.docker.io/v1/')
                    {
                        sh 'docker push sakthisanjay2119/alpine_nginx'
                    }
                }
                
            }

            stage('Docker container.')
            {
                steps
                {
                    sh 'docker run --name alpine_container -d -p 8015:80 sakthisanjay2119/alpine_nginx'
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
