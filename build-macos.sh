#!/bin/bash

set -ex

SNAPSHOT=swift-wasm-5.5-SNAPSHOT-2021-10-28-a
TOOLCHAIN=/Library/Developer/Toolchains/$SNAPSHOT.xctoolchain

install_toolchain() {
if [ ! -e $TOOLCHAIN ]; then
  PKG_FILENAME=$SNAPSHOT-macos_$(uname -m).pkg
  TOOLCHAIN_URL=https://github.com/swiftwasm/swift/releases/download/$SNAPSHOT/$PKG_FILENAME
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