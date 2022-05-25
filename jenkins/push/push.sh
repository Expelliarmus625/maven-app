#!/bin/bash

echo "*******************Pushing Image*************************"

IMAGE="maven-project"


echo "Logging in to docker"
docker login -u expelliarmus625 -p $PASS
echo "Tagging Image"
docker tag $IMAGE:$BUILD_TAG expelliarmus625/$IMAGE:$BUILD_TAG
echo "Pushing Image to Docker Hub"
docker push expelliarmus625/$IMAGE:$BUILD_TAG
