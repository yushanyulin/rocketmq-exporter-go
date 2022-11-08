FROM quay.io/prometheus/busybox:latest


ARG TARGETOS
ARG TARGETARCH

COPY ./build/rocketmq-exporter_${TARGETOS}_${TARGETARCH} /home/exporter/rocketmq-exporter

WORKDIR /home/exporter/

ENTRYPOINT ["/home/exporter/rocketmq-exporter"]
