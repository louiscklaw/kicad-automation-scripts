#!/usr/bin/env bash

docker build -t logickee/kicad-automation-scripts ..
docker build -t logickee/kicad ../Dockerfile.kicad

# docker image rm $(docker image ls -qa)