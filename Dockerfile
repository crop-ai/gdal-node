#----------------------------------- #
# gdal-base image with full build deps
#----------------------------------- #
FROM osgeo/gdal:ubuntu-full-3.3.1

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y curl fonts-dejavu fontconfig spatialite-bin ca-certificates libssl-dev

# Set Node and Node Version Manager Versions
ENV NODE_VERSION=12.6.0
ENV NVM_VERSION v0.35.3

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash

# Install NODE
RUN . ~/.nvm/nvm.sh; \
    nvm install $NODE_VERSION; \
    nvm use --delete-prefix $NODE_VERSION;

# Install NPM
RUN apt-get install -y npm
