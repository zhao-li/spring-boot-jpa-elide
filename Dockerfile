FROM gradle:4.8.0

USER root
RUN apt-get update && apt-get install -qq -y \
  shellcheck
USER gradle

WORKDIR /usr/src/app/

COPY . /usr/src/app/
