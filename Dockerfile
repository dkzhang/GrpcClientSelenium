FROM dkzhang007/grpc-golang:1.0

RUN go get github.com/golang/protobuf/protoc-gen-go

WORKDIR /app

COPY . /app

RUN protoc -I queryDouBanID/ queryDouBanID/the.proto --go_out=plugins=grpc:queryDouBanID/

RUN go build client.go

CMD ["./client"]