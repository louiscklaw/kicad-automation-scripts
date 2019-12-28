#!/usr/bin/env bash

docker build -t logickee/kicad:latest $PWD/Dockerfile.kicad
docker push logickee/kicad

docker build -t logickee/kicad-automation-scripts .
docker push logickee/kicad-automation-scripts

# docker image rm $(docker image ls -qa)