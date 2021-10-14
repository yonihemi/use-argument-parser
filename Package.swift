// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "use-argument-parser",
    dependencies: [
        .package(url: "https://github.com/yonihemi/swift-argument-parser", .branch("swiftwasm-support")),
    ],
    targets: [
        .executableTarget(
            name: "use-argument-parser",
            dependencies: [
				.product(name: "ArgumentParser", package: "swift-argument-parser"),
			]),
    ]
)
