FROM ubuntu:18.04

LABEL maintainer="rkramesh1988@gmail.com"
RUN apt update -yqq && \
    apt install -yqq python-pip && \
    apt install -yqq curl && \
    apt install -yqq speedtest-cli && \
    apt install -yqq jq && \
    apt install -yqq bash && \
    apt install -yqq wget

RUN pip install docker --no-cache-dir && \
    pip install telepot --no-cache-dir

RUN wget https://raw.githubusercontent.com/sivel/speedtest-cli/v2.1.3/speedtest.py -O /usr/lib/python3/dist-packages/speedtest.py

RUN mkdir /opt/dockerbot

COPY dockerbot.py /opt/dockerbot
COPY docker_events.sh /opt/dockerbot
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENV API_KEY ""
ENTRYPOINT ["/entrypoint.sh"]

