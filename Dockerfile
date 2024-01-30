FROM alpine:3

RUN addgroup -S runner && adduser -S -G runner runner

RUN apk add --no-cache curl

COPY ./gandi-dynamic-dns .

USER runner

ENTRYPOINT ./gandi-dynamic-dns

LABEL org.opencontainers.image.source="https://github.com/AdamVig/gandi-dynamic-dns"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="gandi-dynamic-dns"
LABEL org.opencontainers.image.description="Script and Docker container to update the IP address of a gandi.net domain."
