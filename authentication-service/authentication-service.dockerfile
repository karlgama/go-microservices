FROM alpine:latest

RUN mkdir /app

EXPOSE 8081

COPY authApp /app

CMD ["/app/authApp"]
