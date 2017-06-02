#!/bin/sh

set -o pipefail

FILE=./centos-7-extended
IMAGE=micsigen/centos-extended
VERSION=7

docker build -t ${IMAGE}:${VERSION} $FILE | tee build.log || exit 1
ID=$(tail -1 build.log | awk '{print $3;}')