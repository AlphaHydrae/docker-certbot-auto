FROM alphahydrae/certbot

MAINTAINER Simon Oulevay (Alpha Hydrae) <docker@alphahydrae.com>

RUN apt-get update \
    && apt-get install -q -y cron wget

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/local/bin/dumb-init

RUN rm -f /etc/cron.d/* && \
    rm -f /etc/cron.hourly/* && \
    rm -f /etc/cron.daily/* && \
    rm -f /etc/cron.weekly/* && \
    rm -f /etc/cron.monthly/*

ADD cron.sh /usr/local/bin/cron
ADD crontab /etc/cron.d/crontab
ADD auto.sh /usr/local/bin/auto

ENTRYPOINT [ "/usr/local/bin/dumb-init" ]
CMD [ "/usr/local/bin/cron" ]
