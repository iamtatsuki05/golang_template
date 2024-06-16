FROM ubuntu:22.04 AS base

ARG GO_VERSION=1.21

ENV DEBIAN_FRONTEND=noninteractive
ENV WORKDIR /app/
ENV GOROOT /usr/lib/go-${GO_VERSION}
ENV GOPATH /go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

WORKDIR /opt

# Install development tools and required packages
RUN apt-get update && apt-get install -y \
  vim neovim nano \
  git git-lfs \
  zip unzip \
  curl wget make build-essential xz-utils file tree \
  sudo \
  dnsutils \
  tzdata language-pack-ja \
  software-properties-common \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# For Japanese settings
# ENV TZ Asia/Tokyo
# ENV LANG ja_JP.utf8

# For US settings
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US

# Install Go
RUN add-apt-repository ppa:longsleep/golang-backports && \
  apt-get update && apt-get install -y \
  golang-${GO_VERSION} \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
# Create symlink for Go
RUN ln -s /usr/lib/go-${GO_VERSION} /usr/local/go

# Copy source
COPY ./src ${WORKDIR}


FROM base AS dev
WORKDIR ${WORKDIR}

COPY . ${WORKDIR}

# Install Go tools
COPY go.mod go.sum ${WORKDIR}
RUN go mod download
