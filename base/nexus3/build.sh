#!/bin/bash
docker build --no-cache . -t eryajf/nexus3:3.38.1
docker push eryajf/nexus3:3.38.1