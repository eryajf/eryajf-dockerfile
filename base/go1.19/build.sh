#!/bin/bash
docker build --no-cache  -t eryajf/go:1.19 .
docker push eryajf/go:1.19