#!/usr/bin/env bash


echo 'Run schematic ERC'
sh scripts/test_run_erc.sh
sh scripts/test_gen_svg.sh
sh scripts/test_run_layout_drc.sh
sh scripts/test_gen_zip_ger_file.sh

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
