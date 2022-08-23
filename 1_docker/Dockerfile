FROM alpine:3.16.2

#set variables
ARG path=/var/bitcoin
ARG tarfile=bitcoin-22.0-arm-linux-gnueabihf.tar.gz 
ENV bitcoin_dir=bitcoin-22.0

#set working dir
WORKDIR $path

#updates 
RUN apt update

#download the tar and shasums
ADD https://bitcoincore.org/bin/bitcoin-core-22.0/$tarfile $path
ADD https://bitcoincore.org/bin/bitcoin-core-22.0/SHA256SUMS $path

#this should check that the sum matches, though how on earth can you store the value of a command in an ARG?
#seriously. I just want to run a simple if statement spits out "OK" and then use that in conditional logic 
RUN sha256sum $tarfile | sha256sum -c SHA256SUMS 2>/dev/null | grep $tarfile | awk '{print $2}'

RUN tar -xvf $tarfile && cd bitcoin-22.0/bin 
RUN install -m 0755 -o root -g root -t /usr/local/bin/ /var/bitcoin/bitcoin-22.0/bin/*

#all I should have to do is run "/bitcoind -daemon" but I can't get it to build for arm. 

#and set the entrypoint
