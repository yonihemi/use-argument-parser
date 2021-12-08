#!/bin/bash

set -ex

RELEASE_TAG=swift-wasm-5.5.0-RELEASE
TOOLCHAIN=/Library/Developer/Toolchains/$RELEASE_TAG.xctoolchain

install_toolchain() {
if [ ! -e $TOOLCHAIN ]; then
  PKG_FILENAME=$RELEASE_TAG-macos_$(uname -m).pkg
  TOOLCHAIN_URL=https://github.com/swiftwasm/swift/releases/download/$RELEASE_TAG/$PKG_FILENAME
  curl -L -C - "$TOOLCHAIN_URL" -o /tmp/$PKG_FILENAME
  sudo installer -pkg /tmp/$PKG_FILENAME -target /
fi
}

install_wasmer() {
if [ ! -e ~/.wasmer/bin/wasmer ]; then
  curl https://get.wasmer.io -sSfL | sh
fi
}

install_toolchain
install_wasmer

$TOOLCHAIN/usr/bin/swift build --triple wasm32-unknown-wasi -Xswiftc -lFoundation -Xswiftc -lCoreFoundation -Xswiftc -licui18n -c release
wasmer .build/wasm32-unknown-wasi/release/use-argument-parser.wasm -- hello -c 3
