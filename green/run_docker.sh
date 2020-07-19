#!/usr/bin/env bash

docker build --tag=ahsan2132/testgreenimage .
docker image ls
docker run -d -p 8000:80 ahsan2132/testgreenimage
