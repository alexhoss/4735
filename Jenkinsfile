node {
    def app

    stage('Clone repository') {
        // clone the repo

        checkout scm
    }

    stage('Build image') {
    // Build the image

        app = docker.build("alexhoss/helloworld")
    }

    stage('Test image') {
        //TODO add tests

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        //Push image with build number and latest tag
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

    //   stage('Push to heroku') {
    //   steps{
    //     sh "heroku create"
    //   }

    //     stage('Remove Unused docker image') {
    //   steps{
    //     sh "docker rmi $registry:$BUILD_NUMBER"
    //   }
    // }
    
}
