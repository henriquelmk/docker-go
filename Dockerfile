FROM golang:alpine AS builder

WORKDIR /go/src/app
COPY /main.go .
RUN go build main.go

FROM scratch

COPY --from=builder /go/src/app .

CMD ["/main"]