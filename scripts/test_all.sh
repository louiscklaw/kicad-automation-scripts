#!/usr/bin/env bash

# sh scripts/build.sh

echo 'clear old ogv'
ls -l $(find ./test -type d -name "*_output")
rm -rf $(find ./test -type d -name "*_output")

bash ./scripts/test1.sh | tee ./scripts/test1.log
bash ./scripts/test2.sh | tee ./scripts/test2.log
