#!/usr/bin/env bash


echo 'Run schematic ERC'
sh scripts/run_erc.sh
sh scripts/gen_svg.sh

# docker run --rm -t \
#   -v $PWD/test/test_proj1:/kicad-project \
#   -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
#   logickee/kicad-automation-scripts \
#   python -m kicadAutomation.eeschema.schematic run_erc /kicad-project/test.sch /kicad-project/ERC_output
# ls -l test/test_proj1/ERC_output

# echo 'Export a schematic to PDF or SVG'
# sh scripts/gen_svg.sh
# ls -l test/test_proj1/SVG_output

# echo 'Run layout DRC:'
# docker run --rm -it \
#   -v $PWD/test/test_proj1:/kicad-project \
#   -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
#   logickee/kicad-automation-scripts \
#   python -m kicadAutomation.pcbnew_automation.run_drc /kicad-project/test.kicad_pcb /kicad-project/DRC_output

# echo 'Generate a zip file with gerber files for PCB manufacuring:'
# docker run --rm -t \
#   -v $PWD/test/test_proj1:/kicad-project \
#   -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
#   logickee/kicad-automation-scripts \
#   python -m kicadAutomation.pcbnew_automation.plot /kicad-project/test.kicad_pcb PLOT_output

# echo 'Generate a pdf with the layout layers and drill map file:'
# docker run --rm -t \
#   -v $PWD/test/test_proj1:/kicad-project \
#   -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
#   logickee/kicad-automation-scripts \
#   python -m kicadAutomation.pcbnew_automation.plot -f pdf /kicad-project/test.kicad_pcb DRILL_PLOT_output


# docker run --rm -it \
#   -v $PWD/test/test_proj1:/kicad-project \
#   -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
#   logickee/kicad-automation-scripts /bin/bash
