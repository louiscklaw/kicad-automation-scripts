#!/usr/bin/env bash

# rm -rf /kicad-project/output
echo "schematic directory: $2"
echo "output directory: $3"

docker run --rm -it \
  -v $PWD/src:/usr/lib/python3/dist-packages/kicadAutomation \
  -v $1:/kicad-project \
  logickee/kicad-automation-scripts \
  python3 -m kicadAutomation.eeschema.schematic run_erc $2 $3

sudo chown 1000:1000 -R $1/ERC_output

ls -l $1/ERC_output

exit

echo 'run-erc done'