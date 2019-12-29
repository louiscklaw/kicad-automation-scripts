#!/usr/bin/env bash

sh scripts/build.sh

rm -rf test/test_proj1/ERC_output/*.ogv
rm -rf test/test_proj1/SVG_output/*.ogv