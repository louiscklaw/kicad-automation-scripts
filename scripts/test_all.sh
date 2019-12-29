#!/usr/bin/env bash

# sh scripts/build.sh

echo 'clear old ogv'
ls -l $(find . -type f -name "*.ogv")
rm -rf $(find . -type f -name "*.ogv")

bash ./test1.sh
bash ./test2.sh