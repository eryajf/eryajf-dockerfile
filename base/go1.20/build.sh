#!/bin/bash
docker build --no-cache  -t eryajf/go:1.20 .
docker push eryajf/go:1.20