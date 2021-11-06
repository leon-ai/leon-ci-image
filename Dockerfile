FROM node:16-alpine

# Install system packages
RUN apk add --no-cache \
    ca-certificates \
    build-base \
    py3-pip \
    git

# Upgrade pip and install Pipenv
RUN pip3 install --upgrade pip \
	&& pip install pipenv
