#!/usr/bin/env bash

# rm -rf /kicad-project/output
echo "schematic directory: $1"
echo "output directory: $2"

python -m kicadAutomation.eeschema.schematic export $1 $2