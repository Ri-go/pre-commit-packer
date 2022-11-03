#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

if [ -z "$(command -v packer)" ]; then
    echo "packer is required"
    exit 1
fi
for i in "$@"; do
    case $i in
    -v=* | --var-file=*)
        VARFILE="${i#*=}"
        shift # past argument=value
        ;;
    -* | --*)
        echo "Unknown option $i"
        exit 1
        ;;
    *) ;;

    esac
done
if ! packer validate -var-file=$VARFILE .; then
    echo "Failed"
    echo "================================"
    exit 1
else
    echo "Successful"
    echo "================================"
    exit 0
fi
