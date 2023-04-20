FROM eryajf/centos:7.9

LABEL maintainer eryajf

ENV NODE=/usr/local/node
ENV PATH=$PATH:$NODE/bin
ENV pack_url "https://nodejs.org/dist/latest-v16.x/"

RUN  set -ex && wget -q $pack_url/node-v16.20.0-linux-x64.tar.gz \
    && tar -C /usr/local -xf node-v16.20.0-linux-x64.tar.gz \
    && mv /usr/local/node-v16.20.0-linux-x64/ /usr/local/node \
    && rm -f node-v16.20.0-linux-x64.tar.gz  \
    && yum -y install make gcc gcc-c++ git && yum clean all \
    && rm -rf /var/cache/yum/* && mkdir -p /data/.cache/node/{node_global,node_cache}

RUN npm install -g yarn pm2 cnpm@8.2.0 pnpm http-server --registry=https://registry.npmmirror.com \
    && echo -e "prefix=/data/.cache/node/node_global\ncache=/data/.cache/node/node_cache\nregistry=https://registry.npmmirror.com" > /root/.npmrc \
    && echo 'registry "https://registry.npmmirror.com"' > ~/.yarnrc \
    && ln -snf /data/.cache/node/node_global/bin/pnpm /usr/local/bin/pnpm \
    && yarn config set cache-folder /data/.cache/node/node_cache