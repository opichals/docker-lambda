ARG ARCH
FROM golang:1

WORKDIR /app

ENV CGO_ENABLED=0

COPY go.mod go.sum ./
RUN go mod download

COPY init.go ./
RUN GOARCH=${ARCH} GOOS=linux go build init.go

FROM amazonlinux:2023

COPY --from=0 /app/init /var/runtime/init
