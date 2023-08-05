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
                url 'https://github.com/abhi08tcs/nopCommerceJuly23.git'

                }
        }
        
        }
        stage ('restore')
        {
           sh 'dotnet restore src/NopCommerce.sln'

        }
        stage ('build')
        {
            sh 'dotnet build src/NopCommerce.sln'
        }
        stage ('zip')
        {
             zip zipFile: 'nopcommerce.zip', archive: false, dir: 'archive' 
        }
        stage ('rtupload')
        {
            serverId : 'MY_JFROG'
            spec 
            {
            "files": [
                  {
                     "pattern": "*.zip",
          
                  }
                    ]
            }
        }
    }
}
