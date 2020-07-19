#!/usr/bin/env bash

dockerpath=ahsan2132/testblueimage
echo "Docker ID and Image: $dockerpath"
docker login --username ahsan2132
docker tag testblueimage ahsan2132/testblueimage
docker push ahsan2132/testblueimage
