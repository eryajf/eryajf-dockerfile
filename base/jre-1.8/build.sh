#!/bin/bash
docker build --no-cache . -t eryajf/jre:1.8.0_202
docker push eryajf/jre:1.8.0_202