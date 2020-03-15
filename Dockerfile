FROM alpine:latest

RUN apk update && \
    apk add ca-certificates curl bind-tools && \
    apk add bash && rm -rf /var/cache/apk/*

COPY ./entrypoint.sh ./

RUN mkdir -p /var/log && \
    touch /var/log/cron.log && \
    chmod +x entrypoint.sh && \
    ln -sf /dev/stdout /var/log/cron.log 

ENTRYPOINT ["/entrypoint.sh"]
