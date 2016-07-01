package haproxycmd

import (
	"flag"
	"os"
)

func ParseFlag() string {
	var sock string
	flag.StringVar(&sock, "socket", os.Getenv("HAPROXY_SOCKET"), "haproxy socket path")
	flag.Parse()
	return sock
}
