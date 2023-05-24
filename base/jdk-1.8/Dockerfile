FROM eryajf/centos:7.9

ENV LANG en_US.utf8
ENV TIME_ZONE Asia/Shanghai
ENV pack_url "https://packages.baidu.com/app/jdk-8/"

RUN yum -y install vim wget net-tools kde-l10n-Chinese fontconfig \
    && localedef -c -f UTF-8 -i en_US en_US.utf8 && yum clean all \
    && mkdir /usr/local/jdk8 \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone

RUN set -ex && wget -q $pack_url/jdk-8u241-linux-x64.tar.gz \
    && tar -C  /usr/local/jdk8 -xf jdk-8u241-linux-x64.tar.gz \
    && rm -f /root/jdk-8u241-linux-x64.tar.gz

ENV JAVA_HOME /usr/local/jdk8/jdk1.8.0_241
ENV PATH $PATH:$JAVA_HOME/bin