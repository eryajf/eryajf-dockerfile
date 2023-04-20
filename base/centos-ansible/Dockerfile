FROM eryajf/centos:7.9

LABEL maintainer eryajf

WORKDIR /root

ENV TZ "Asia/Shanghai"
ENV LC_ALL "zh_CN.utf8"

RUN yum -y install epel-release && yum -y install ansible rsync openssh-clients bc