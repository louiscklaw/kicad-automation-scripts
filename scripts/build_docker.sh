#!/usr/bin/env bash

# docker build -t logickee/kicad-base -f Dockerfile.kicad-base dockerfiles
docker build -t logickee/kicad-base -f ./dockerfiles/Dockerfile.kicad-base ./dockerfiles
docker build -t logickee/kicad-automation-scripts -f ./dockerfiles/Dockerfile.kicad-automation ./dockerfiles

docker push logickee/kicad-base
docker push logickee/kicad-automation-scripts

# docker image rm $(docker image ls -qa)