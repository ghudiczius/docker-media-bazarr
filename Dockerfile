FROM python:3.12.10

ARG VERSION

RUN groupadd --gid=1000 bazarr && \
    useradd --gid=1000 --home-dir=/opt/bazarr --no-create-home --shell /bin/bash --uid 1000 bazarr && \
    mkdir /data /movies /opt/bazarr /series && \
    curl --location --output /tmp/bazarr.zip --silent "https://github.com/morpheus65535/bazarr/releases/download/v${VERSION}/bazarr.zip" && \
    unzip /tmp/bazarr.zip -d /opt/bazarr && \
    chown --recursive 1000:1000 /data /movies /opt/bazarr /series && \
    cd /opt/bazarr && \
    pip install --requirement requirements.txt && \
    rm /tmp/bazarr.zip

USER 1000
VOLUME /data /movies /series
WORKDIR /opt/bazarr

EXPOSE 6767
ENTRYPOINT ["python"]
CMD ["/opt/bazarr/bazarr.py", "--config=/data"]
