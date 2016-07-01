package main

import (
	"haproxycmd"
	"log"
	"os"
)

func init() {
	log.SetFlags(0)
}

func main() {
	defer func() {
		if err := recover(); err != nil {
			log.Fatalf("error: %s", err)
		}
	}()

	sock := haproxycmd.ParseFlag()

	if sock == "" {
		sock = haproxycmd.FindHaproxySocket()
	}

	haproxycmd.Command(sock, os.Args[1:], os.Stdout)
}
