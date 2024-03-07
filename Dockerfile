FROM ubuntu:22.04

RUN mkdir -p /var/log/snmptrapd && mkdir -p /mibs && \
    apt-get update && apt-get install -y \
    snmp snmptrapd libnet-snmp-perl snmp-mibs-downloader && \
    rm -rf /var/cache/apt/* && apt-get clean && \
    download-mibs 

EXPOSE 162
CMD ["snmptrapd","-n","-L","o","-f"]
