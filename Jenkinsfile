pipeline
{
    agent any
    
        stages
        {
            stage('Docker version')
            {
                steps
                {
                    sh 'docker --version'
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
                    sh 'docker run --name alpine_container -d -p 8015:80 --rm sakthisanjay2119/alpine_nginx'
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

        post
        {
            always
            {
                sh 'echo "stages ended"'
            }

            success
            {
                sh 'echo "Docker is present and the task is successfully completed."'
            }

            failure
            {
                sh 'echo "Docker is not present"'
            }

            changed
            {
                sh 'echo "Status of build is changed with respect to last build (success to failure / failure to sucess).."'
            }

            unstable
            {
                sh 'echo "Jenkins build is unstable.."'
            }
        }
    
}
