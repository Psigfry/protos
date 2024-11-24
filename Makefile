# Makefile for generating gRPC files

.PHONY: generate

generate:
	@export PATH=$$PATH:$$HOME/go/bin && \
	protoc -I proto proto/sso/sso.proto --go_out=./gen/go --go_opt=paths=source_relative --go-grpc_out=./gen/go --go-grpc_opt=paths=source_relative

