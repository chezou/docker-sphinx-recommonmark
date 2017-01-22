# Format: FROM    repository[:version]
FROM       ubuntu:16.04

# Usage:
# docker run -it -v <your directory>:/documents/


ENV DEBIAN_FRONTEND noninteractive

# Update apt-get sources AND install stuff
RUN apt-get update && apt-get install -y -q python3 python3-sphinx texlive texlive-latex-extra texlive-lang-cjk pandoc build-essential python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install recommonmark

RUN mkdir documents

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
