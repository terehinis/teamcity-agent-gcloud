# teamcity-agent-gcloud
```
docker run -ti --privileged \
  -e SERVER_URL=<TeamCity server url> \
  -e DOCKER_IN_DOCKER=start \
  -v ~/.kube/config:/root/.kube/config \
  terehinis/teamcity-agent-gcloud:latest
```
