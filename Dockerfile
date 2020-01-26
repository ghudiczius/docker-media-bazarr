FROM python:3.8.1

ARG VERSION

RUN groupadd --gid=1000 bazarr && \
    useradd --gid=1000 --home-dir=/opt/bazarr --no-create-home --shell /bin/bash --uid 1000 bazarr && \
    mkdir /data /movies /opt/bazarr /series && \
    curl --location --output /tmp/bazarr.tar.gz --silent "https://github.com/morpheus65535/bazarr/archive/v${VERSION}.tar.gz" && \
    tar xvzf /tmp/bazarr.tar.gz --directory=/opt/bazarr --strip-components=1 && \
    chown --recursive 1000:1000 /data /movies /opt/bazarr /series

USER 1000
VOLUME /data /movies /series
WORKDIR /opt/bazarr

EXPOSE 6767
ENTRYPOINT ["python", "/opt/bazarr/bazarr.py", "--config=/data"]
