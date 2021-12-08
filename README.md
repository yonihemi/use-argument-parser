# use-argument-parser

Minimal package for testing [Swift Argument Parser](https://github.com/apple/swift-argument-parser) in Webassembly using [SwiftWasm](https://swiftwasm.org/).
## Requirements
- A recent SwiftWasm toolchain, e.g. [SwiftWasm 5.5](https://github.com/swiftwasm/swift/releases/tag/swift-wasm-5.5.0-RELEASE).
- A WebAssembly runtime, such as [Wasmer](https://wasmer.io/), [wasmtime](https://wasmtime.dev/) or [Wasm3](https://github.com/wasm3/wasm3/blob/main/docs/Installation.md).

# Build and Run
```sh
/Library/Developer/Toolchains/swift-wasm-5.5.0-RELEASE.xctoolchain/usr/bin/swift build --triple wasm32-unknown-wasi -Xswiftc -lFoundation -Xswiftc -lCoreFoundation -Xswiftc -licui18n -c release

wasmer .build/wasm32-unknown-wasi/release/use-argument-parser.wasm -- hello -c 3
# or
wasmtime .build/wasm32-unknown-wasi/release/use-argument-parser.wasm hello -c 3
# or
wasm3 build/wasm32-unknown-wasi/release/use-argument-parser.wasm hello -c 3
```