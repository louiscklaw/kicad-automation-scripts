#!/usr/bin/env bash

# rm -rf /kicad-project/output
echo "schematic directory: $2"
echo "output directory: $3"

docker run --rm -it \
  -v $PWD/src:/usr/lib/python3/dist-packages/kicadAutomation \
  -v $1:/kicad-project \
  logickee/kicad-automation-scripts \
  python3 -m kicadAutomation.eeschema.schematic export $2 $3

sudo chown 1000:1000 -R $1/SVG_output

echo 'gen_svg done'