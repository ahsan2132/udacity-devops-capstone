#!/usr/bin/env bash

dockerpath=ahsan2132/testgreenimage

echo "Docker ID and Image: $dockerpath"
docker login --username ahsan2132
docker tag testgreenimage ahsan2132/testgreenimage
docker push ahsan2132/testgreenimage
