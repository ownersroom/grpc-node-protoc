FROM grpc/node AS jsbuild

RUN apt-get update && apt-get -y install unzip && apt-get clean

ENV PB_VER 3.6.0
ENV PB_URL https://github.com/google/protobuf/releases/download/v${PB_VER}/protoc-${PB_VER}-linux-x86_64.zip
RUN mkdir -p /tmp/protoc && \
    curl -L ${PB_URL} > /tmp/protoc/protoc.zip && \
    cd /tmp/protoc && \
    unzip protoc.zip && \
    cp /tmp/protoc/bin/protoc /usr/local/bin && \
    cp -R /tmp/protoc/include/* /usr/local/include && \
    chmod go+rx /usr/local/bin/protoc && \
    cd /tmp && \
	rm -r /tmp/protoc

