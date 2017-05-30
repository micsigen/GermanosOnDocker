#!/bin/sh

set -o pipefail

FILE=weblogic-10.3.6
IMAGE=micsigen/weblogic
VERSION=10.3.6

docker build -t ${IMAGE}:${VERSION} $FILE | tee build.log || exit 1
ID=$(tail -1 build.log | awk '{print $3;}')
