#!/bin/bash
docker build --no-cache . -t eryajf/jdk:1.8.0_241
docker push eryajf/jdk:1.8.0_241