#!/usr/bin/env bash

# rm -rf /kicad-project/output
echo "schematic directory: $1"
echo "output directory: $2"

docker run --rm -it \
  -v $PWD/test/test_proj1:/kicad-project \
  -v $PWD/src:/usr/lib/python3/dist-packages/kicadAutomation \
  logickee/kicad-automation-scripts \
  python3 -m kicadAutomation.eeschema.schematic export /kicad-project/test.sch /kicad-project/SVG_output

sudo chown 1000:1000 -R test/test_proj1/SVG_output

echo 'gen_svg done'