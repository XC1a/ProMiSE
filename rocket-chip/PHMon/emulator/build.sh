#!/bin/bash -ex
source ../env.sh
rm -r ../../src
cp -r ../../src-repo/src-phmon ../../src
make CONFIG=KomodoCppConfig ROCKETCHIP_ADDONS=varanus -j8
