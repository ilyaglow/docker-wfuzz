FROM alpine:edge
LABEL maintainer "Ilya Glotov <ilya@ilyaglotov.com>"

RUN apk --update --no-cache add python \
                                py-curl \
  && apk --no-cache add git \
  && git clone --branch=master \
               --depth=1 \
               https://github.com/xmendez/wfuzz.git \
  && apk del git \
  && rm -rf /wfuzz/.git

RUN adduser -D wfuzz \
  && chown -R wfuzz /wfuzz

USER wfuzz

WORKDIR wfuzz

ENTRYPOINT ["./wfuzz"]
