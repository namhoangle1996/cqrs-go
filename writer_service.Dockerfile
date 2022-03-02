FROM golang:1.17-alpine

RUN mkdir /app

ENV CONFIG=docker

COPY . /app

WORKDIR /app



RUN  CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o writer_service writer_service/cmd/main.go
RUN chmod +x ./writer_service
CMD    [ "/app/writer_service" ]
