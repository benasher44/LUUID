// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "LUUID",
    platforms: [
        .macOS(.v10_12), .iOS(.v10), .watchOS(.v3), .tvOS(.v10)
    ],
    products: [
        .library(name: "LUUID", targets: ["LUUID"]),
    ],
    targets: [
        .target(name: "LUUID", path: "LUUID", exclude: ["Info.plist", "LUUID.h"]),
        .testTarget(name: "LUUIDTests", dependencies: ["LUUID"], path: "LUUIDTests", exclude: ["Info.plist"]),
    ]
)

