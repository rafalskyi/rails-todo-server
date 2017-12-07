def repoCreds = '2eb4ef06-76a2-4e47-9d9d-cb0d631ef231'
def repoName = 'git@github.com:rafalskyi/rails-todo-server.git'

node() {
    stage('Git CheckOut') {
        timestamps {
            checkout([
                $class                           : 'GitSCM',
                branches                         : [[name: '*/master']],
                doGenerateSubmoduleConfigurations: false,
                extensions                       : [],
                submoduleCfg                     : [],
                userRemoteConfigs                : [[
                    credentialsId: "${repoCreds}",
                    url          : "${repoName}",
                    poll         : true
                ]]
            ])
        }
    }


    stage('Start rails server') {
        timestamps {
            sh 'rails s &'
        }
    }


}