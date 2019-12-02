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

        sh "docker login --username=_ --password=a5220ff8-cb7b-40ce-8f6d-4403cc9114a5 registry.heroku.com"
        sh "docker build -t registry.heroku.com/helloworld/web:1.0 ."

       //sh "docker tag 1.0 registry.heroku.com/peaceful-woodland-64656/web:latest"
        sh "docker push registry.heroku.com/peaceful-woodland-64656/web"

         sh "sudo heroku container:push web -a peaceful-woodland-64656"
         sh "sudo heroku container:release web -a peaceful-woodland-64656"
      }

    //     stage('Remove Unused docker image') {
    //   steps{
    //     sh "docker rmi $registry:$BUILD_NUMBER"
    //   }
    // }
    

}
