FROM ubuntu:latest

# Usage:
# docker run -it -v <your directory>:/documents/


ENV DEBIAN_FRONTEND noninteractive

# Update apt-get sources AND install stuff
RUN apt-get update && apt-get install -y -q \
  git \
  latexmk \
  make \
  python-pip \
  texlive \
  texlive-latex-extra \
  texlive-lang-cjk \
  && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN pip install Sphinx
RUN pip install recommonmark
RUN pip install sphinxcontrib-textstyle
## tk0miya's *diag series
RUN pip install sphinxcontrib-blockdiag sphinxcontrib-nwdiag sphinxcontrib-seqdiag sphinxcontrib-actdiag
RUN rm -rf ~/.chache/pip

RUN mkdir documents

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
