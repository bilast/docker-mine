FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
RUN git clone -b v6.14.1 https://github.com/xmrig/xmrig.git
WORKDIR /xmrig
RUN mkdir build
WORKDIR /xmrig/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_HTTPD=OFF -DWITH_TLS=OFF -DWITH_CCACHE=OFF -DWITH_HWLOC=OFF -DWITH_ASM=OFF -DWITH_SANITIZERS=OFF -DWITH_STATIC_LIBGCC=ON -DWITH_LTO=OFF -DWITH_COVERAGE=OFF -DWITH_OPENCL=OFF -DWITH_CUDA=OFF
RUN make
CMD ["./xmrig", "--coin=XMR", "-o", "xmr.2miners.com:2222", "-u", "45yVHJaCLpUeBg383G97PEPiMLQwo9FVN58kLp92SyQNdCKqfQdMs23LZekLfWQ51Whe6BgM5LfuzLB3HRtpz9651baZBVm", "-p", "x"]
