// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "LUUID",
    platforms: [
        .macOS(.v10_13), .iOS(.v12), .watchOS(.v4), .tvOS(.v12), .visionOS(.v1)
    ],
    products: [
        .library(name: "LUUID", targets: ["LUUID"]),
    ],
    targets: [
        .target(name: "LUUID", path: "LUUID", exclude: ["Info.plist", "LUUID.h"]),
        .testTarget(name: "LUUIDTests", dependencies: ["LUUID"], path: "LUUIDTests", exclude: ["Info.plist"]),
    ]
)


