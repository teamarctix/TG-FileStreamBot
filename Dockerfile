FROM golang:1.21-alpine3.18 as builder
RUN apk update && apk upgrade --available && sync
WORKDIR /app
COPY . .
FROM scratch
COPY --from=builder /app/fsb /app/fsb
EXPOSE ${PORT}
ENTRYPOINT ["/app/fsb", "run"]
