#!/usr/bin/env bash


# docker build -t logickee/kicad:latest $PWD/Dockerfile.kicad
# docker push logickee/kicad

# docker build -t logickee/kicad-automation-scripts .
# docker push logickee/kicad-automation-scripts

# docker image rm $(docker image ls -qa)

sudo rm -rf test/schematic/output

# docker run --rm -it \
#   -v $PWD/test/schematic:/kicad-project \
#   -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
#   logickee/kicad-automation-scripts \
#   python -m kicadAutomation.eeschema.schematic export /kicad-project/test.sch /kicad-project/output
