#!/bin/bash
docker build --no-cache  -t eryajf/go:1.18 .
docker push eryajf/go:1.18