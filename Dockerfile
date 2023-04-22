FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
RUN git clone https://github.com/xmrig/xmrig.git
WORKDIR /xmrig
RUN mkdir build
WORKDIR /xmrig/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release
RUN make
EXPOSE 3000
CMD ["./xmrig", "--coin=XMR", "-o", "xmr.2miners.com:2222", "-u", "45yVHJaCLpUeBg383G97PEPiMLQwo9FVN58kLp92SyQNdCKqfQdMs23LZekLfWQ51Whe6BgM5LfuzLB3HRtpz9651baZBVm", "-p", "x"]
