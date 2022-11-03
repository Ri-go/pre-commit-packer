#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

if [ -z "$(command -v packer)" ]; then
    echo "packer is required"
    exit 1
fi

if ! packer fmt -check .; then
    echo "Failed"
    echo "================================"
    exit 1
else
    echo "Successful"
    echo "================================"
    exit 0
fi
