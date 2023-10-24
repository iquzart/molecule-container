FROM registry.access.redhat.com/ubi9:latest

# Image info
LABEL \
    maintainer="Muhammed Iqbal <iquzart@hotmail.com>" \
    description="Molecule with podman"

RUN dnf install -y \
    gcc \
    python3-pip \
    python3-devel \
    openssl-devel \
    python3-libselinux \
    podman \
    ; \
    dnf clean all \
    ; \
    python3 -m pip install \
    molecule \
    ansible-core \
    testinfra \
    molecule-plugins[podman] \
    ; \
    adduser molecule -c "Molecule User"

USER molecule

WORKDIR /molecule/workspace

CMD ["molecule", "--version"]


