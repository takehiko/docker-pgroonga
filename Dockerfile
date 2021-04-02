FROM postgres:12-alpine
LABEL maintainer="Takehiko Murakawa <takehiko@sys.wakayama-u.ac.jp>"

ENV LANG=ja_JP.UTF-8 \
    MECAB_VERSION=0.996 \
    IPADIC_VERSION=2.7.0-20070801 \
    mecab_url="https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE" \
    ipadic_url="https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM" \
    POSTGRES_HOST_AUTH_METHOD=trust \
    GROONGA_VERSION=11.0.1 \
    PGROONGA_VERSION=2.2.8

WORKDIR /root

# Install build tools
RUN apk add --update --no-cache build-base clang clang-dev llvm pkgconf openssl \
# Install MeCab + IPADIC
 && wget -O mecab-${MECAB_VERSION}.tar.gz ${mecab_url} \
 && tar zxf mecab-${MECAB_VERSION}.tar.gz \
 && cd mecab-${MECAB_VERSION} \
 && ./configure --enable-utf8-only --with-charset=utf8 \
 && make \
 && make install \
 && cd .. \
 && wget -O mecab-ipadic-${IPADIC_VERSION}.tar.gz ${ipadic_url} \
 && tar zxf mecab-ipadic-${IPADIC_VERSION}.tar.gz \
 && cd mecab-ipadic-${IPADIC_VERSION} \
 && ./configure --with-charset=utf8 \
 && make \
 && make install \
 && cd .. \
# Install Groonga
 && wget https://packages.groonga.org/source/groonga/groonga-${GROONGA_VERSION}.tar.gz \
 && tar xvzf groonga-${GROONGA_VERSION}.tar.gz \
 && cd groonga-${GROONGA_VERSION} \
 && sed -i -e '25i#include <stdbool.h>' lib/ii.c \
 && ./configure \
 && make \
 && make install \
 && cd .. \
# Install PGroonga
 && wget https://packages.groonga.org/source/pgroonga/pgroonga-${PGROONGA_VERSION}.tar.gz \
 && tar xvf pgroonga-${PGROONGA_VERSION}.tar.gz \
 && cd pgroonga-${PGROONGA_VERSION} \
 && sed -i -e '6i#include <stdbool.h>' src/pgroonga.h \
 && make \
 && make install \
 && cd .. \
# Clean up
 && apk del build-base pkgconf clang clang-dev llvm \
 && apk add --update --no-cache libstdc++ \
 && rm -rf \
    mecab-${MECAB_VERSION}* \
    mecab-ipadic-${IPADIC_VERSION}* \
    groonga-${GROONGA_VERSION}*  \
    pgroonga-${PGROONGA_VERSION}* \
    /usr/local/share/doc/groonga \
    /usr/local/share/groonga
