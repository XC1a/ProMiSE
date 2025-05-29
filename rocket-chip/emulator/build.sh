#!/bin/bash -ex
source ./tests/env.sh
rm -r ../src
cp -r ../src-repo/src-ours ../src
if [ $1=='DEBUG' ];then
	make CONFIG=RoccExampleConfig debug -j8
else
	make CONFIG=RoccExampleConfig -j8
fi
