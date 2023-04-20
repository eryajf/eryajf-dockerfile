#!/bin/bash
docker build --no-cache  -t eryajf/centos-ansible:2.9 .
docker push eryajf/centos-ansible:2.9