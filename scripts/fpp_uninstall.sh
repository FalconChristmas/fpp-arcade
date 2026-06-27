#!/bin/bash

# fpp-arcade uninstall script
echo "Running fpp-arcade uninstall Script"

BASEDIR=$(dirname $0)
cd $BASEDIR
cd ..
make clean

