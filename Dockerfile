FROM public.ecr.aws/amazonlinux/amazonlinux:latest

RUN yum update -y && yum install -y \
    git \
    curl \
    build-essential \
    gdb \
    nasm \
    yasm \
    gcc \
    clang \
    cmake \
    binutils \
    openssl11-devel \
    systemd-devel \
    zlib-devel \
    yum-utils \
&& yum upgrade -y \
&& curl -o ~/vsls-reqs https://aka.ms/vsls-linux-prereq-script && chmod +x ~/vsls-reqs && ~/vsls-reqs

RUN debuginfo-install -y \
    bzip2-libs-1.0.6-13.amzn2.0.3.aarch64 \
    elfutils-libelf-0.176-2.amzn2.aarch64 \
    elfutils-libs-0.176-2.amzn2.aarch64 \
    glibc-2.26-61.amzn2.aarch64 \
    libcap-2.54-1.amzn2.0.1.aarch64 \
    libgcc-7.3.1-15.amzn2.aarch64 \
    libgcrypt-1.5.3-14.amzn2.0.3.aarch64 \
    libgpg-error-1.12-3.amzn2.0.3.aarch64 \
    libselinux-2.5-12.amzn2.0.2.aarch64 \
    lz4-1.7.5-2.amzn2.0.1.aarch64 \
    openssl11-libs-1.1.1g-12.amzn2.0.9.aarch64 \
    pcre-8.32-17.amzn2.0.2.aarch64 \
    systemd-libs-219-78.amzn2.0.20.aarch64 \
    xz-libs-5.2.2-1.amzn2.0.3.aarch64 \
    zlib-1.2.7-19.amzn2.0.2.aarch64

WORKDIR /playground/src
RUN git clone https://github.com/fluent/fluent-bit.git

RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
&& echo $SNIPPET >> "/root/.bashrc"
