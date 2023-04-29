FROM eryajf/jre:1.8.0_202

ARG MVND_VERSION=0.8.2
ARG USER_HOME_DIR="/root"
ARG BASE_URL=https://ghproxy.com/https://github.com/apache/maven-mvnd/releases/download/${MVND_VERSION}

RUN mkdir -p /usr/share/mvnd /usr/share/mvnd/ref \
  && yum -y install gzip \
  && yum -y update \
  && rm -rf /var/cache/yum \
  && curl -fsSL -o /tmp/maven-mvnd.tar.gz ${BASE_URL}/maven-mvnd-${MVND_VERSION}-linux-amd64.tar.gz \
  && tar -xzf /tmp/maven-mvnd.tar.gz -C /usr/share/mvnd --strip-components=1 \
  && rm -f /tmp/maven-mvnd.tar.gz \
  && ln -s /usr/share/mvnd/bin/mvnd /usr/bin/mvnd

ENV MAVEN_HOME /usr/share/mvnd
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

COPY mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
# 可添加自定义settings.xml文件
COPY settings.xml /root/.m2/settings.xml
RUN chmod +x /usr/local/bin/mvn-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvnd"]