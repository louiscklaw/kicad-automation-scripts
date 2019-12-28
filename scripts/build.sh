#!/usr/bin/env bash


docker build -t logickee/kicad:latest $PWD/Dockerfile.kicad
docker push logickee/kicad

docker build -t logickee/kicad-automation-scripts .
docker push logickee/kicad-automation-scripts

sudo rm -rf $PWD/test/schematic/ERC_output
sudo rm -rf $PWD/test/schematic/SVG_output
sudo rm -rf $PWD/test/schematic/DRC_output
sudo rm -rf $PWD/test/schematic/output

echo 'Run schematic ERC'
docker run --rm -it \
  -v $PWD/test/schematic:/kicad-project \
  -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
  logickee/kicad-automation-scripts \
  python -m kicadAutomation.eeschema.schematic run_erc /kicad-project/test.sch /kicad-project/ERC_output

echo 'Export a schematic to PDF or SVG'
docker run --rm -it \
  -v $PWD/test/schematic:/kicad-project \
  -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
  logickee/kicad-automation-scripts \
  python -m kicadAutomation.eeschema.schematic export /kicad-project/test.sch /kicad-project/SVG_output

echo 'Run layout DRC:'
docker run --rm -it \
  -v $PWD/test/schematic:/kicad-project \
  -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
  logickee/kicad-automation-scripts \
  python -m kicadAutomation.pcbnew_automation.run_drc /kicad-project/test.kicad_pcb /kicad-project/DRC_output

echo 'Generate a zip file with gerber files for PCB manufacuring:'
docker run --rm -t \
  -v $PWD/test/schematic:/kicad-project \
  -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
  logickee/kicad-automation-scripts \
  python -m kicadAutomation.pcbnew_automation.plot /kicad-project/test.kicad_pcb PLOT_output

echo 'Generate a pdf with the layout layers and drill map file:'
docker run --rm -t \
  -v $PWD/test/schematic:/kicad-project \
  -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
  logickee/kicad-automation-scripts \
  python -m kicadAutomation.pcbnew_automation.plot -f pdf /kicad-project/test.kicad_pcb DRILL_PLOT_output


# docker run --rm -it \
#   -v $PWD/test/schematic:/kicad-project \
#   -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
#   logickee/kicad-automation-scripts /bin/bash

# docker image rm $(docker image ls -qa)