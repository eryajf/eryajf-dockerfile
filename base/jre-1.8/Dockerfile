FROM oraclelinux:7-slim as builder

LABEL maintainer="Oracle JRE Docker Maintainers <759600963@qq.com>"
# Since the files is compressed as tar.gz first yum install gzip and tar
RUN set -eux; \
        yum install -y \
                gzip \
                tar \
        ; \
        rm -rf /var/cache/yum

# Default to UTF-8 file.encoding
ENV LANG en_US.UTF-8

# Environment variables for the builder image.
# Required to validate that you are using the correct file

# 方法一：官方地址下载jre包
# http://www.oracle.com/technetwork/java/javase/downloads/index.html,jdk
# ENV JAVA_PKG=server-jre-8u201-linux-x64.tar.gz \
#         JAVA_HOME=/usr/java/jre-8
# COPY $JAVA_PKG /tmp/jre.tgz

# 方法二：山东女子开源软件镜像站下载jre包
ENV pack_url="http://mirrors.sdwu.edu.cn/java" \
        JAVA_HOME=/usr/java/jre-8
RUN curl -L $pack_url/server-jre-8u202-linux-x64.tar.gz -o /tmp/jre.tgz

RUN set -eux; \
        mkdir -p "$JAVA_HOME"; \
        tar --extract --file /tmp/jre.tgz --directory "$JAVA_HOME" --strip-components 1;

## Get a fresh version of SLIM for the final image

FROM oraclelinux:7-slim

# Default to UTF-8 file.encoding
ENV LANG en_US.UTF-8

ENV JAVA_VERSION=1.8.0_202 \
        JAVA_HOME=/usr/java/jre-8

ENV     PATH $JAVA_HOME/bin:$PATH
# Copy the uncompressed Java Runtime from the builder image
COPY --from=builder $JAVA_HOME $JAVA_HOME
# 添加自定义中文字体
# RUN mkdir -p /usr/share/fonts/windows
# ADD *.ttf /usr/share/fonts/windows
# ADD *.ttc /usr/share/fonts/windows
##
RUN     ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone; \
        yum -y update; \
        yum -y install fontconfig; \
        rm -rf /var/cache/yum; \
        ln -sfT "$JAVA_HOME" /usr/java/default; \
        ln -sfT "$JAVA_HOME" /usr/java/latest; \
        for bin in "$JAVA_HOME/bin/"*; do \
                base="$(basename "$bin")"; \
                [ ! -e "/usr/bin/$base" ]; \
                alternatives --install "/usr/bin/$base" "$base" "$bin" 20000; \
        done; \
# -Xshare:dump will create a CDS archive to improve startup in subsequent runs
# the file will be stored as /usr/java/jdk-8/jre/lib/amd64/server/classes.jsa
# See https://docs.oracle.com/javase/8/docs/technotes/guides/vm/class-data-sharing.html
        java -Xshare:dump;
