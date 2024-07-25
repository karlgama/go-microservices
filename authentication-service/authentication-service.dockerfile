#base go image
FROM golang:1.22.5-alpine AS builder

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o authApp ./cmd/api

RUN chmod +x /app/authApp
#  build a tiny docker image
FROM alpine:latest

RUN mkdir /app

EXPOSE 8081
ENV DSN="host=postgres port:5432 user=postgres dbname=users password=postgres sslmode=disable timezone=UTC connect_timeout=5"
COPY --from=builder /app/authApp /app

CMD ["/app/authApp"]