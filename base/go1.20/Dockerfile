FROM eryajf/centos:7.9

LABEL maintainer eryajf

ENV pack_url "https://go.dev/dl/"

RUN  set -ex && \
    wget -q $pack_url/go1.20.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xf go1.20.3.linux-amd64.tar.gz && rm -f go1.20.3.linux-amd64.tar.gz && \
    yum -y install gcc gcc-c++ make pcre pcre-devel openssl openssl-devel && yum clean all && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

ENV GOROOT=/usr/local/go
ENV GOPATH=/data/go
ENV GOCACHE=/data/.cache/go-build
ENV PATH=$PATH:$GOROOT/bin

ENV GOSUMDB="gosum.io+ce6e7565+AY5qEHUk/qmHc5btzW45JVoENfazw8LielDsaI+lEbq6"
ENV GOPROXY="https://proxy.golang.com.cn,direct"