#!/bin/sh

set -o pipefail

FILE=./atg-10.1.2
IMAGE=micsigen/atg
VERSION=10.1.2

docker build -t ${IMAGE}:${VERSION} $FILE | tee build.log || exit 1
ID=$(tail -1 build.log | awk '{print $3;}')