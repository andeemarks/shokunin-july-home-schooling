FROM alpine:3.7
RUN wget https://downloads.factorcode.org/releases/0.98/factor-linux-x86-64-0.98.tar.gz
RUN tar -zxvf factor-linux-x86-64-0.98.tar.gz 
WORKDIR shokunin-july-home-schooling 
RUN cd shokunin-july-home-schooling
ENTRYPOINT ["factor"]

