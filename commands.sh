sudo docker login --username=alexhoss --password a5220ff8-cb7b-40ce-8f6d-4403cc9114a5 registry.heroku.com

a5220ff8-cb7b-40ce-8f6d-4403cc9114a5

cd /var/lib/jenkins/workspace/4735


docker login --username=_ --password=a5220ff8-cb7b-40ce-8f6d-4403cc9114a5 registry.heroku.com
docker build -t registry.heroku.com/helloworld/web .

docker tag 1 registry.heroku.com/boiling-ocean-39734/web
docker push registry.heroku.com/boiling-ocean-39734/web

heroku container:push web -a boiling-ocean-39734
heroku container:release web -a boiling-ocean-39734


heroku logs -a boiling-ocean-39734



ls -la /var/lib/jenkins/workspace/4735/.git/index.lock