FROM golang:1.10.0-alpine3.7

WORKDIR /go/src/github.com/gaku3601/CircleCIAndGCP
COPY . .
RUN go install github.com/gaku3601/CircleCIAndGCP
ENTRYPOINT ["CircleCIAndGCP"]