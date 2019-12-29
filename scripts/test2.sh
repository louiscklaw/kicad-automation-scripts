#!/usr/bin/env bash

echo 'test 2'
  # sh scripts/test_run_erc.sh \
  #   $PWD/test/test_proj2 \
  #   /kicad-project/test_proj2.sch /kicad-project/ERC_output

  # echo 'checking output'
  # ls -l $PWD/test/test_proj2/ERC_output/test_proj2.erc

  # sh scripts/test_gen_svg.sh \
  #   $PWD/test/test_proj2 \
  #   /kicad-project/test_proj2.sch /kicad-project/SVG_output

  # echo 'checking output'
  # ls -l $PWD/test/test_proj2/SVG_output/test_proj2.svg
  # ls -l $PWD/test/test_proj2/SVG_output/test_proj2-1-test_proj2-1.sch.svg


  sh scripts/test_run_layout_drc.sh \
    $PWD/test/test_proj2 \
    /kicad-project/test_proj2.kicad_pcb /kicad-project/DRC_output

  echo 'checking output'
  ls -l $PWD/test/test_proj2/DRC_output/test_proj2.erc

  # sh scripts/test_gen_zip_ger_file.sh \
  #   $PWD/test/test_proj2 \
  #   /kicad-project/test_proj2.kicad_pcb /kicad-project/GER_output
