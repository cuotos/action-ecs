FROM golang:alpine as builder

WORKDIR /app

COPY go.mod go.sum main.go ./

RUN CGO_ENABLED=0 go build -o /action-ecs ./...


FROM alpine

COPY --from=builder /action-ecs /action-ecs

ENTRYPOINT [ "/action-ecs" ]