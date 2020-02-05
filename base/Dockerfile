FROM alpine:latest

COPY . /bootstrap
WORKDIR /bootstrap
RUN ./bootstrap.sh

WORKDIR /
CMD ["/sbin/init"]
