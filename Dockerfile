FROM dkzhang007/grpc-golang

RUN go get -u github.com/golang/protobuf/protoc-gen-go

WORKDIR /app

COPY . /app

RUN protoc -I queryDouBanID/ queryDouBanID/the.proto --go_out=plugins=grpc:queryDouBanID/

RUN go build client.go

CMD ["./client"]