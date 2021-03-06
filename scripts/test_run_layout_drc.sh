#!/usr/bin/env bash

echo 'Run layout DRC:'
echo "schematic directory: $2"
echo "output directory: $3"


docker run --rm -it \
  -v $PWD/src:/usr/lib/python3/dist-packages/kicadAutomation \
  -v $1:/kicad-project \
  logickee/kicad-automation-scripts \
  python3 -m kicadAutomation.pcbnew_automation.run_drc $2 $3

sudo chown 1000:1000 -R $1/DRC_output

echo 'gen_svg done'


# echo 'Run layout DRC:'
# docker run --rm -it \
#   -v $PWD/test/test_proj1:/kicad-project \
#   -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
#   logickee/kicad-automation-scripts \
#   python -m kicadAutomation.pcbnew_automation.run_drc /kicad-project/test.kicad_pcb /kicad-project/DRC_output
