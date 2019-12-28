#!/usr/bin/env bash

# NOTE: assume running from project root !

# docker build -t logickee/kicad-base -f Dockerfile.kicad-base dockerfiles

echo 'building kicad-base'
  docker build -t logickee/kicad-base -f ./dockerfiles/Dockerfile.kicad-base ./dockerfiles
echo 'build kicad-base done'

echo 'building kicad-automation-scripts'
  mkdir -p ./dockerfiles/temp
    cp -R src ./dockerfiles/temp/src
    cp -R config ./dockerfiles/temp/config
      docker build -t logickee/kicad-automation-scripts -f ./dockerfiles/Dockerfile.kicad-automation ./dockerfiles
  rm -rf ./dockerfiles/temp
echo 'build kicad-automation-scripts done'

# docker image rm $(docker image ls -qa)