#!/bin/bash
# build
docker build --no-cache  -t eryajf/node:16.20 .
# push
docker push eryajf/node:16.20