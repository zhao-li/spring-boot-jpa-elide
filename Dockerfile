FROM java:8

ARG BASE=/usr/src/app

RUN apt-get update && apt-get install -qq -y \
  shellcheck

WORKDIR ${BASE}
COPY ./gradlew ${BASE}
COPY ./gradle/ ${BASE}/gradle/
COPY ./build.gradle ${BASE}/
COPY ./src/main/java/com/matthewcasperson/elidetest/Application.java ${BASE}/src/main/java/com/matthewcasperson/elidetest/
RUN ./gradlew build

COPY . /usr/src/app/
