#!/bin/sh

echo "Running fpp-arcade PreStart Script"

BASEDIR=$(dirname $0)
cd $BASEDIR
cd ..
make
