from golang:1.14.1-alpine3.11
ENV GO111MODULE=on
WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build


EXPOSE 8080
ENTRYPOINT ["/app/httpserver"]
