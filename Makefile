VERSION = $(shell git tag | tail -n 1)
GOOS := $(shell go env GOOS)
GOARCH := $(shell go env GOARCH)
RUNTIME_GOPATH := $(GOPATH):$(shell pwd)
SRC := $(wildcard *.go) $(wildcard src/haproxycmd/*.go)

all: haproxycmd

haproxycmd: $(SRC)
	GOPATH=$(RUNTIME_GOPATH) go build -o haproxycmd

clean:
	rm -f haproxycmd *.gz

package: clean haproxycmd
	gzip -c haproxycmd > haproxycmd-$(VERSION)-$(GOOS)-$(GOARCH).gz
