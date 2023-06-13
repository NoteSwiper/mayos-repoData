#!/bin/bash
set -euxo pipefail

WORKDIR=$(pwd)

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
LOG_DIR=$( cd -P "$( dirname "$SCRIPT_DIR" )" >/dev/null 2>&1 && pwd )

ARG="$1"

echo "this shell script is in-development."
echo "the result is blank or error or else if you execute this!"

tee "${LOG_DIR}/result.log" | tail -n 10
