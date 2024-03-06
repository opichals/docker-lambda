#!/bin/bash

input_file="runtimes.txt"
arch=amd64
arch=arm64

while IFS= read -r line; do
  read -r runtime version <<<"$(echo "$line" | awk '{print $2, $4}')"

  for something in some_list; do
    docker build --platform linux/${arch} --build-arg ARCH="${arch}" --build-arg RUNTIME="$runtime" --build-arg VERSION="$version" -f Dockerfile-"$runtime" -t mlupin/docker-lambda:"${runtime}"."${version}" .
    exit_status=$?

    if [ $exit_status -ne 0 ]; then
      echo "Docker build failed with exit status $exit_status"
      exit $exit_status
    fi
  done
done <"$input_file"
