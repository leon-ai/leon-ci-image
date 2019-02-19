FROM alpine:3.9

# Install system packages
RUN apk update --no-cache \
  && apk add --no-cache \
    ca-certificates \
    build-base \
    nodejs \
    npm \
    python3 \
    yarn \
    git

RUN git clone -b master --depth=1 https://github.com/leon-ai/leon.git leon \
  && cd leon \
  && npm i 

RUN ln -sf /usr/bin/pip3 /usr/bin/pip

WORKDIR leon

COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 1337

VOLUME ["/leon/.env"]

ENTRYPOINT [ "/start.sh" ]