#!/usr/bin/env bash

echo 'Generate a zip file with gerber files for PCB manufacuring:'
echo "schematic directory: $2"
echo "output directory: $3"

docker run --rm -it \
  -v $PWD/src:/usr/lib/python3/dist-packages/kicadAutomation \
  -v $1:/kicad-project \
  logickee/kicad-automation-scripts \
  python -m kicadAutomation.pcbnew_automation.plot /kicad-project/test.kicad_pcb /kicad-project/GER_output

sudo chown 1000:1000 -R $1/GER_output

# docker run --rm -t \
#   -v $PWD/test/test_proj1:/kicad-project \
#   -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
#   logickee/kicad-automation-scripts \
#   python -m kicadAutomation.pcbnew_automation.plot /kicad-project/test.kicad_pcb PLOT_output

echo 'gen_svg done'
