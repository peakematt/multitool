FROM ubuntu:22.04
LABEL org.opencontainers.image.source = "https://github.com/matthewboehlke/multitool"


# Install packages from apt and pip
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN echo "**** Installing from apt ****" && \
    apt-get update -y && apt-get install -y \
    vim \
    emacs \
    nmap \
    htop \
    screen \
    zip \
    unzip \
    openssh-client \
    tmux \
    awscli \
    s3cmd \
    python3 \
    python3-pip \
    ansible \
    curl \ 
    wget \
    sudo \
    openssl \
    git \
    gpg

RUN useradd --system --create-home --home-dir /home/ubuntu --shell /bin/bash --gid root --groups sudo --uid 10001 --password "$(openssl passwd -1 ubuntu)" ubuntu && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Run install scripts for various tools
COPY src/ /scripts

USER ubuntu

RUN echo "**** Installing and configuring tools ****" && \ 
    /scripts/install-all.sh

# Steampipe UI 
EXPOSE 9194