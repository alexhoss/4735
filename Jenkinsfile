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

      stage('Push to heroku and release') {
    
        sh "docker build -t registry.heroku.com/helloworld/web:1.0 ."

       //sh "docker tag 1.0 registry.heroku.com/boiling-ocean-39734/web"
        sh "docker push registry.heroku.com/boiling-ocean-39734/web"

        sh "heroku container:push web -a boiling-ocean-39734"
        sh "heroku container:release web -a boiling-ocean-39734"
      }

    //     stage('Remove Unused docker image') {
    //   steps{
    //     sh "docker rmi $registry:$BUILD_NUMBER"
    //   }
    // }
    

}
