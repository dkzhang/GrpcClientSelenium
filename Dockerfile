FROM dkzhang007/my-grpc-golang:my1.0

#RUN go get github.com/golang/protobuf/protoc-gen-go

WORKDIR /go/src/GrpcClientSelenium

COPY . /go/src/GrpcClientSelenium

RUN protoc -I queryDouBanID/ queryDouBanID/the.proto --go_out=plugins=grpc:queryDouBanID/

RUN go build client.go

CMD ["./client"]