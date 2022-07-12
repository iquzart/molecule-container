FROM alpine:3.16

# Image info
LABEL \
    maintainer="Muhammed Iqbal <iquzart@hotmail.com>" \
    description="Molecule with podman"

WORKDIR /molecule/workspace

ADD requirements.txt /molecule/molecule-requirements.txt

RUN apk add --update --no-cache \
    git \
    gcc \
    python3 \
    python3-dev \
    musl-dev \
    py3-pip \
    podman \
    bash

RUN pip3 install -r ../molecule-requirements.txt

CMD ["molecule", "--version"]


