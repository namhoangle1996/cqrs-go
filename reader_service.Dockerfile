FROM golang:1.17-alpine

RUN mkdir /app

ENV CONFIG=docker

COPY . /app

WORKDIR /app



RUN  CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o reader_service reader_service/cmd/main.go
RUN chmod +x ./reader_service
CMD    [ "/app/reader_service" ]
