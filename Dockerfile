FROM alpine:3.10

LABEL maintainer="Jeremy Garigliet <jeremy.garigliet@gmail.com>"

# Phantomjs needs this ¯\_(ツ)_/¯
ENV OPENSSL_CONF=/etc/ssl/
ENV PHANTOMJS_VERSION 2.1.1

# Set timezone
RUN apk add -U --no-cache tzdata curl \
    && cp /usr/share/zoneinfo/Europe/Paris /etc/localtime \
    && echo "Europe/Paris" > /etc/timezone \
    && date \
    && apk del tzdata

RUN apk add --no-cache \
      nodejs \
      npm

RUN apk add --update --no-cache curl && \
    curl -Ls "https://github.com/dustinblackman/phantomized/releases/download/${PHANTOMJS_VERSION}/dockerized-phantomjs.tar.gz" | tar xz -C / && \
    curl -k -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 | tar -jxvf - -C / && \
    cp phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
    rm -fR phantomjs-${PHANTOMJS_VERSION}-linux-x86_64 && \
    apk del curl

RUN npm install -g markdown-pdf --ignore-scripts && \
    mkdir /workdir

WORKDIR /workdir

ENTRYPOINT [ "markdown-pdf", "-p", "/usr/local/bin/phantomjs", "-c", "/workdir" ]

CMD [ "-h" ]