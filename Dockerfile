FROM alpine:3

RUN apk add --no-cache curl

COPY ./gandi-dynamic-dns .

ENTRYPOINT ./gandi-dynamic-dns