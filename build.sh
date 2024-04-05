#!/bin/bash

exec_dir="executables"
oss="linux windows darwin"
archs="arm64 amd64"

version="0.0.1"

for os in $oss; do
  for arch in $archs; do
    CGO_ENABLED=0 GOOS=$os GOARCH=$arch go build -o ${exec_dir}/main-${os}-${arch}-${version}
  done
done
