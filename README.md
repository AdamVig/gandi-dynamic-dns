# Gandi Dynamic DNS

Script and Docker container to update the IP address of a [gandi.net](https://www.gandi.net/) domain.

- updates every hour (configurable)
- gets external IP address from [icanhazip.com](https://major.io/icanhazip-com-faq/)
- automatically skips update if external IP has not changed
- only 3.35 MB

# Usage
## Environment Variables
- `GANDI_API_KEY`: API key from `https://account.gandi.net/en/users/<your username>/security`
- `DOMAIN`: domain name registered with gandi.net, for example `example.com`
- `RECORD_NAME`: name of the DNS record to update
  - could be the name of the subdomain, for example, `foo` to update the IP for `foo.example.com`
  - could be `@` to update the IP for the domain itself
- `UPDATE_INTERVAL`: time interval between updates (optional)
  - defaults to `1h` (one hour)
  - must be in [the format used by GNU `sleep`](https://www.gnu.org/software/coreutils/manual/html_node/sleep-invocation.html#sleep-invocation)

## Script

```shell
export GANDI_API_KEY=12345
export DOMAIN=example.com
export RECORD_NAME=foo
./gandi-dynamic-dns
```

## Docker Image

### One-Off

This will build, run, then remove the image. It should only be used for local testing.

```shell
docker run --rm -it -e 'GANDI_API_KEY=12345' -e 'DOMAIN=example.com' -e 'RECORD_NAME=foo' "$(docker build -q .)"
```

### Docker Compose

```yml
version: "3.7"
services:
  gandi-dynamic-dns:
    image: adamvig/gandi-dynamic-dns:latest
    environment:
      - GANDI_API_KEY=12345
      - DOMAIN=example.com
      - RECORD_NAME=foo
```