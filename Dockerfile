# Format: FROM repository[:version]
FROM ubuntu:18.04 as base

FROM base as tex-base
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends -q \
        texlive \
        texlive-latex-extra \
        texlive-lang-cjk \
        texlive-lang-japanese \
        ghostscript \
        fonts-noto-cjk \
        fonts-noto-cjk-extra \
        make \
        latexmk \
        git \
        openssh-client \
        python3 \
        python3-dev

FROM base as python-setting
RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends -q \
        build-essential \
        wget \
        python3 \
        python3-dev \
        libjpeg-dev \
        zlib1g-dev \
        libfreetype6 \
        libfreetype6-dev
COPY requirements.txt .
COPY constraints.txt .
RUN python3 -m venv --without-pip /install \
    && . /install/bin/activate \
    && wget --no-check-certificate -L -O get-pip.py https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && pip3 install --no-cache-dir -U pip \
    && pip3 install --no-cache-dir --install-option="--prefix=/install" -r requirements.txt -c constraints.txt

# Usage:
# docker run -it -v <your directory>:/documents/
FROM tex-base
COPY --from=python-setting /install /install

RUN mkdir documents
WORKDIR /documents
VOLUME /documents
ENV PATH /install/bin:$PATH
CMD ["/bin/bash"]


