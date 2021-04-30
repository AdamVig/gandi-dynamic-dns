FROM alpine:3

RUN addgroup -S runner && adduser -S -G runner runner

RUN apk add --no-cache curl

COPY ./gandi-dynamic-dns .

USER runner

ENTRYPOINT ./gandi-dynamic-dns