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
        stage ('vcs')
        {
            steps
            {
                url 'https://github.com/abhi08tcs/nopCommerceJuly23.git',
                branch 'develop'

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
            sh 'dotnet build -c Release src/NopCommerce.sln',
            
            }
        }
        stage ('publish')
        {
            steps
            {
                publish 'dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj-output -o publish'
            }
        }
        stage ('creating directories')
        {
            steps
            {
                mkdir 'publish/bin',
                mkdir 'publish/logs'
            }
        }
        stage ('zip')
        {
            steps
            { 
             zip zipFile: 'nopcommerce.zip', archive: false, dir: 'archive' 
            }
        }
    }
}

