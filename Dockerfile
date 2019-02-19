FROM alpine:3.9

# Install system packages
RUN apk update --no-cache \
  && apk add --no-cache \
    ca-certificates \
    build-base \
    nodejs \
    npm \
    python3 \
    git

RUN ln -sf /usr/bin/pip3 /usr/bin/pip
RUN pip install --upgrade pip
RUN pip install --user pipenv
RUN ln -sf /root/.local/bin/pipenv /usr/bin/pipenv

RUN git clone -b master --depth=1 https://github.com/leon-ai/leon.git leon \
  && cd leon \
  && npm i \
  && npm run postinstall

COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR leon

EXPOSE 1337

CMD /start.sh