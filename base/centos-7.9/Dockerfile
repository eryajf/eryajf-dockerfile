FROM centos:7.9.2009

LABEL maintainer eryajf

WORKDIR /root

ENV TZ "Asia/Shanghai"
ENV LC_ALL "zh_CN.utf8"

RUN yum install -y wget curl unzip telnet bash-completion vim net-tools tcpdump jq nc make && \
    yum -y install libtool-ltdl-devel kde-l10n-Chinese python-pip openssl openssl-devel glibc-common && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && yum clean all && rm -rf /var/cache/yum/*