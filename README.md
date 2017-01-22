# docker-sphinx-recommonmark
Sphinx documentation toolchain, latex dependencies and pandoc including [recommonmark](https://github.com/rtfd/recommonmark) in an Ubuntu docker container.

# How to Use it
docker run -it -v <your directory>:/documents/ chezou/docker-sphinx-recommonmark
Use sphinx-quickstart to create a new Sphinx project, and make to use the auto generated Makefile in an existing project. More info in the Sphinx tutorial.

The built container is available at the Docker Hub.

Based on [docker-sphinx](https://hub.docker.com/r/plaindocs/docker-sphinx/).
