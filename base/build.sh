#!/usr/bin/env bash

set -euxo pipefail

docker build --platform linux/amd64 --build-arg ARCH=amd64 --no-cache --squash -t mlupin/lambda-base-2023:build-amd64 .
docker build --platform linux/arm64 --build-arg ARCH=arm64 --no-cache --squash -t mlupin/lambda-base-2023:build-arm64 .
