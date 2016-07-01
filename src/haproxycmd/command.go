package haproxycmd

import (
	"fmt"
	"io"
	"net"
	"strings"
)

func Command(sock string, args []string, out io.Writer) {
	conn, err := net.Dial("unix", sock)

	if err != nil {
		panic(err)
	}

	cmd := strings.Join(args, " ")
	fmt.Fprintln(conn, cmd)

	io.Copy(out, conn)
}
