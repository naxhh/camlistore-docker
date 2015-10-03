FROM debian

WORKDIR /bin

COPY ./bin/camlistored /bin/camlistored

EXPOSE 80
VOLUME ["/data"]
VOLUME ["/config"]

ENV HOME /data

ENTRYPOINT ["/bin/camlistored", "-listen", ":80", "-configfile", "/config/server-config.json"]