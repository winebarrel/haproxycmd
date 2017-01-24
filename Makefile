SHELL          := /bin/bash
VERSION        := v0.1.1
GOOS           := $(shell go env GOOS)
GOARCH         := $(shell go env GOARCH)
RUNTIME_GOPATH := $(GOPATH):$(shell pwd)
SRC            := $(wildcard *.go) $(wildcard src/*/*.go)

CENTOS_IMAGE=docker-go-pkg-build-centos6
CENTOS_CONTAINER_NAME=docker-go-pkg-build-centos6-$(shell date +%s)

all: haproxycmd

haproxycmd: go-get $(SRC)
	GOPATH=$(RUNTIME_GOPATH) go build -a -tags netgo -installsuffix netgo -o haproxycmd
ifeq ($(GOOS),linux)
	[[ "`ldd haproxycmd`" =~ "not a dynamic executable" ]] || exit 1
endif

go-get:
	go get github.com/aws/aws-sdk-go

package: clean haproxycmd
	gzip -c haproxycmd > pkg/haproxycmd-$(VERSION)-$(GOOS)-$(GOARCH).gz

package\:linux:
	docker run --name $(CENTOS_CONTAINER_NAME) -v $(shell pwd):/tmp/src $(CENTOS_IMAGE) make -C /tmp/src package
	docker rm $(CENTOS_CONTAINER_NAME)

rpm:
	docker run --name $(CENTOS_CONTAINER_NAME) -v $(shell pwd):/tmp/src $(CENTOS_IMAGE) make -C /tmp/src rpm:docker
	docker rm $(CENTOS_CONTAINER_NAME)

rpm\:docker: clean
	cd ../ && tar zcf haproxycmd.tar.gz src
	mv ../haproxycmd.tar.gz /root/rpmbuild/SOURCES/
	cp haproxycmd.spec /root/rpmbuild/SPECS/
	rpmbuild -ba /root/rpmbuild/SPECS/haproxycmd.spec
	mv /root/rpmbuild/RPMS/x86_64/haproxycmd-*.rpm pkg/
	mv /root/rpmbuild/SRPMS/haproxycmd-*.src.rpm pkg/

docker\:build\:centos6:
	docker build -f docker/Dockerfile.centos6 -t $(CENTOS_IMAGE) .

clean:
	rm -f pkg/*
