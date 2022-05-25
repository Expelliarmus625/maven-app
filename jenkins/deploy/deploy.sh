#!/bin/bash

echo maven-project > /tmp/.auth
echo "$BUILD_TAG" >> /tmp/.auth
echo "$PASS" >> /tmp/.auth

scp -i /opt/prod-key /tmp/.auth prod-user@13.126.54.131:/tmp/.auth
scp -i /opt/prod-key ./jenkins/deploy/publish.sh prod-user@13.126.54.131:/tmp/publish.sh
ssh -i /opt/prod-key prod-user@13.126.54.131 "/tmp/publish.sh"
