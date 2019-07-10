package main

import (
	"context"
	"log"
	"time"

	pb "GrpcClientSelenium/queryDouBanID"
	"google.golang.org/grpc"
)

const (
	address = "dk.gribgp.com:50051"
)

func main() {
	// Set up a connection to the server.
	conn, err := grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	c := pb.NewQueryIDClient(conn)

	// Contact the server and print out its response.
	ctx, cancel := context.WithDeadline(context.Background(), time.Now().Add(time.Second*30))
	//ctx, cancel := context.WithTimeout(context.Background(), time.Second * 20)
	defer cancel()
	r, err := c.Query(ctx, &pb.IsbnRequest{Isbn: "920910201209"})

	if err != nil {
		log.Fatalf("querry error: %v", err)
	}
	log.Printf("the book DouBan url is: %s", r.Url)
}
