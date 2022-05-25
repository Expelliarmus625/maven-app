#!/bin/bash

#Copy the new jar to build location 

cp -f java-app/target/*.jar jenkins/build

echo "*****************Building Docker Image****************************"
cd jenkins/build && docker-compose -f docker-compose-build.yml build --no-cache 

