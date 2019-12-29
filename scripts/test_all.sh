#!/usr/bin/env bash

# sh scripts/build.sh

echo 'clear old ogv'
ls -l $(find . -type f -name "*.ogv")
rm -rf $(find . -type f -name "*.ogv")

echo 'test 1'
  sh scripts/test_run_erc.sh \
    $PWD/test/test_proj1 \
    /kicad-project/test.sch /kicad-project/ERC_output \

  echo 'checking output'
  ls -l $PWD/test/test_proj1/ERC_output/test.erc

  sh scripts/test_gen_svg.sh \
    $PWD/test/test_proj1 \
    /kicad-project/test.sch /kicad-project/SVG_output

  echo 'checking output'
  ls -l $PWD/test/test_proj1/SVG_output/test.svg


echo 'test 2'
  sh scripts/test_run_erc.sh \
    $PWD/test/test_proj2 \
    /kicad-project/test_proj2.sch /kicad-project/ERC_output

  echo 'checking output'
  ls -l $PWD/test/test_proj2/ERC_output/test_proj2.erc

  sh scripts/test_gen_svg.sh \
    $PWD/test/test_proj2 \
    /kicad-project/test_proj2.sch /kicad-project/SVG_output

  echo 'checking output'
  ls -l $PWD/test/test_proj2/SVG_output/test_proj2.svg
  ls -l $PWD/test/test_proj2/SVG_output/test_proj2-1-test_proj2-1.sch.svg
