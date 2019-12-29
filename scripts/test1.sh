#!/usr/bin/env bash

echo 'test 1'

  echo 'generate ERC'
  sh scripts/test_run_erc.sh \
    $PWD/test/test_proj1 \
    /kicad-project/test.sch /kicad-project/ERC_output \

  echo 'checking output'
  ls -l $PWD/test/test_proj1/ERC_output/test.erc
  echo "ERC generation done"

  echo 'generate SVG'
  sh scripts/test_gen_svg.sh \
    $PWD/test/test_proj1 \
    /kicad-project/test.sch /kicad-project/SVG_output

  echo 'checking output'
  ls -l $PWD/test/test_proj1/SVG_output/test.svg
  echo "SVG generation done"

  echo 'generate drc'
  sh scripts/test_run_layout_drc.sh \
    $PWD/test/test_proj1 \
    /kicad-project/test.kicad_pcb /kicad-project/DRC_output

  echo 'checking output'
  ls -l $PWD/test/test_proj1/DRC_output/drc_result.rpt
  echo "DRC generation done"


  echo 'getting gerber archive'
  sh scripts/test_gen_zip_ger_file.sh \
    $PWD/test/test_proj1 \
    /kicad-project/test_proj1.kicad_pcb /kicad-project/GER_output

  echo 'checking output'
  ls -l $PWD/test/test_proj1/GER_output/test_gerbers.zip
  echo 'GER archive generation done'