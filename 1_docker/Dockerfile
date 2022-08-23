FROM alpine:3.16.2

#set variables
ARG path=/var/bitcoin
ARG tarfile=bitcoin-22.0.tar.gz
ARG result="false"

RUN echo $result

#set working dir
WORKDIR $path

#updates 
RUN apk update

#download the tar and shasums
ADD https://bitcoincore.org/bin/bitcoin-core-22.0/bitcoin-22.0.tar.gz $path
ADD https://bitcoincore.org/bin/bitcoin-core-22.0/SHA256SUMS $path

#check that the sum matches
RUN sha256sum $tarfile | sha256sum -c SHA256SUMS 2>/dev/null | grep $tarfile | awk '{print $2}'


#download sums
#get the sum of the download
#make sure they match, and if not exit
#then untar it
#install any needed libraries
#and run it
#and set the entrypoint


