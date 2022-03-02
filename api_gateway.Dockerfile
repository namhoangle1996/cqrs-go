
FROM golang:1.17-alpine

RUN mkdir /app

ENV CONFIG=docker

COPY . /app

WORKDIR /app


RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o api_gateway_service  api_gateway_service/cmd/main.go
RUN chmod +x ./api_gateway_service
CMD   [ "/app/api_gateway_service" ]

