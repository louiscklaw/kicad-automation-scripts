#!/usr/bin/env bash

SCH_FILE=test.sch
PCB_FILE=test.kicad_pcb

echo 'test 1'

  echo 'generate ERC'
  sh scripts/test_run_erc.sh \
    $PWD/test/test_proj1 \
    /kicad-project/$SCH_FILE /kicad-project/ERC_output \

  echo 'checking output'
  ls -l $PWD/test/test_proj1/ERC_output/test.erc
  echo "ERC generation done"

  echo 'generate SVG'
  sh scripts/test_gen_svg.sh \
    $PWD/test/test_proj1 \
    /kicad-project/$SCH_FILE /kicad-project/SVG_output

  echo 'checking output'
  ls -l $PWD/test/test_proj1/SVG_output/test.svg
  echo "SVG generation done"

  echo 'generate drc'
  sh scripts/test_run_layout_drc.sh \
    $PWD/test/test_proj1 \
    /kicad-project/$PCB_FILE /kicad-project/DRC_output

  echo 'checking output'
  ls -l $PWD/test/test_proj1/DRC_output/drc_result.rpt
  echo "DRC generation done"


  echo 'getting gerber archive'
  sh scripts/test_gen_zip_ger_file.sh \
    $PWD/test/test_proj1 \
    /kicad-project/$PCB_FILE /kicad-project/GER_output

  echo 'checking output'
  ls -l $PWD/test/test_proj1/GER_output/test_gerbers.zip
  echo 'GER archive generation done'