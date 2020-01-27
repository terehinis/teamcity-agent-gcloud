# teamcity-agent-gcloud
```
docker run -ti --privileged \
  -e SERVER_URL=<TeamCity server url> \
  -e DOCKER_IN_DOCKER=start \
  -e AWS_ACCESS_KEY_ID=<AWS access key> \
  -e AWS_SECRET_ACCESS_KEY=<AWS secret access key> \
  -e AWS_DEFAULT_REGION=<AWS default region> \
  -v ~/.kube/config:/root/.kube/config \
  terehinis/teamcity-agent-gcloud:latest
```
