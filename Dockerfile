FROM golang:1.21 as builder

ENV GO111MODULE=on \
  CGO_ENABLED=0 \
  GOOS=linux \
  GOARCH=amd64

WORKDIR /src

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -v -o /action-ecs . 

RUN echo "nobody:x:65534:65534:Nobody:/:" > /etc_passwd

FROM scratch

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc_passwd /etc/passwd
COPY --from=builder --chown=65534:0 /action-ecs /action-ecs

USER nobody
ENTRYPOINT [ "/action-ecs" ]