#!/bin/bash
# build
docker build --no-cache  -t eryajf/alpine:3.18 .
# push
docker push eryajf/alpine:3.18