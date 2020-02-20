FROM ubuntu:18.04 AS dev
EXPOSE 9273
COPY telegraf /

FROM glinton/scratch AS prod
COPY telegraf /
