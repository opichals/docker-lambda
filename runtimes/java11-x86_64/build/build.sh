#!/bin/bash

set -euxo pipefail

docker build --progress plain --squash -t mlupin/docker-lambda:java11-build-x86_64 .
