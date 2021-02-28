FROM openjdk:8-jre-alpine
LABEL maintainer="philipsales"
# OpenRefine 3.0

ENV OPENREFINE_VERSION 3.0
ENV OPENREFINE_FILE openrefine-linux-${OPENREFINE_VERSION}.tar.gz
ENV OPENREFINE_URL https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/${OPENREFINE_FILE}

WORKDIR /app

RUN set -xe \
    && apk add --no-cache bash curl grep tar \
    && curl -sSL ${OPENREFINE_URL} | tar xz --strip 1

VOLUME /data
WORKDIR /data

EXPOSE 3333

ENTRYPOINT ["/app/refine"]
CMD ["-i", "0.0.0.0", "-d", "/data", "-m", "6G"]

#docker container run -d -p 3333:3333 --name openrefine-appv3.0 openrefine-app
