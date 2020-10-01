FROM golang:latest

RUN mkdir -p /app/src
WORKDIR /app/src/
COPY . .

ENV GO111MODULES=on

RUN go build -mod vendor -ldflags "-w -s" -o /app/go-dnsmasq -v .

ENV DNSMASQ_LISTEN=0.0.0.0
EXPOSE 53 53/udp
CMD /app/go-dnsmasq --verbose --rcache 200000 --rcache-ttl 86400 -l 0.0.0.0:53 --ndots 1
