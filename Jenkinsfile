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
                sh 'dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj-output -o publish'
            }
        }
        stage ('creating directories and publish')
        {
            steps
            {
                sh 'mkdir publish/bin publish/logs && zip -r nopCommerce.zip publish'
            }
        }
        stage ('archive')
        {
            steps
            { 
             sh '**/nopCommerce.zip'
            }
        }
    }
}

