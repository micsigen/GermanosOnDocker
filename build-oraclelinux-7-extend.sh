#!/bin/sh

set -o pipefail

FILE=./oraclelinux-7-extend
IMAGE=micsigen/oraclelinux-extend
VERSION=7

docker build -t ${IMAGE}:${VERSION} $FILE | tee build.log || exit 1
ID=$(tail -1 build.log | awk '{print $3;}')