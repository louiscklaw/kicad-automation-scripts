#!/usr/bin/env bash

docker build -t logickee/kicad-automation-scripts .
docker build -t logickee/kicad Dockerfile.kicad

docker push logickee/kicad-automation-scripts
docker push logickee/kicad

# docker image rm $(docker image ls -qa)