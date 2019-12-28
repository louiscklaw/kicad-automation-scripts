#!/usr/bin/env bash

# rm -rf /kicad-project/output
echo "schematic directory: $1"
echo "output directory: $2"

docker run --rm -it \
  -v $PWD/test/schematic:/kicad-project \
  -v $PWD/src:/usr/lib/python2.7/dist-packages/kicadAutomation \
  logickee/kicad-automation-scripts \
  python -m kicadAutomation.eeschema.schematic export /kicad-project/test.sch /kicad-project/SVG_output

# chown 1000:1000 -R test/schematic/SVG_output