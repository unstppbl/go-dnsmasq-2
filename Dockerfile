FROM golang:latest

RUN mkdir -p /app/src
WORKDIR /app/src/
COPY . .

ENV GO111MODULES=on

RUN go build -mod vendor -ldflags "-w -s" -o /app/go-dnsmasq -v .

ENV DNSMASQ_LISTEN=0.0.0.0
EXPOSE 53 53/udp
ENTRYPOINT ["/app/go-dnsmasq"]
