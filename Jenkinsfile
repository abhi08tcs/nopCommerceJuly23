pipeline
{
    agent { label '.NET_7' }
    triggers
    {
        pollSCM ('* * * * *')
    }
    options
    {
         timeout(time: 30, unit: 'MINUTES')
    }
     stages
    {
        stage('vcs') 
        {
            steps 
            {

                git url: 'https://github.com/abhi08tcs/nopCommerceJuly23.git',
                    branch: 'develop'
                   
            }     
        }
        
    
        stage ('restore')
        {
            steps
            {
           sh 'dotnet restore src/NopCommerce.sln'
            }

        }
        stage ('build')
        {
            steps
            {
            sh 'dotnet build -c Release src/NopCommerce.sln'
            
            }
        }
        stage ('publish')
        {
            steps
            {
                //sh 'dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj-output -o publish'
                //src/Presentation/Nop.Web/Nop.Web.csproj-output
                sh 'dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj -o publish'
            }
        }
        stage ('creating directories and publish')
        {
            steps
            {
                //sh 'mkdir publish/bin publish/logs && zip -r nopCommerce.zip publish'
                 sh 'zip -r nopCommerce.zip publish'
                
            }
        }
        stage ('archive')
        {
            steps
            { 
             archive '**/nopCommerce.zip'
            }
        }
        /*stage ('dockercontainer')
        {
            steps
            {
                sh 'docker image build -t nopCommerce:ced0996'
                sh 'docker image tag nopCommmerce:ced0996 abhishek08tcs/nopcommerce:ced0996'
                sh 'docker image push abhishek08tcs/nopCommerce:ced0996'
            }
        }*/
    }

}

