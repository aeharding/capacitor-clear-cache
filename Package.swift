// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorClearCache",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CapacitorClearCache",
            targets: ["ClearCachePlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "ClearCachePlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/ClearCachePlugin"),
        .testTarget(
            name: "ClearCachePluginTests",
            dependencies: ["ClearCachePlugin"],
            path: "ios/Tests/ClearCachePluginTests")
    ]
)