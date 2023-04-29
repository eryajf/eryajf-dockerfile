#!/bin/bash
docker build --no-cache . -t eryajf/mvnd:0.8.2-jdk-8
docker push eryajf/mvnd:0.8.2-jdk-8