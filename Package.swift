// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "feather-push",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
    ],
    products: [
        .library(name: "FeatherPush", targets: ["FeatherPush"]),
        .library(name: "XCTFeatherPush", targets: ["XCTFeatherPush"]),
    ],
    dependencies: [
        .package(url: "https://github.com/feather-framework/feather-service.git", 
            .upToNextMinor(from: "0.2.0")
        ),
    ],
    targets: [
        .target(
            name: "FeatherPush",
            dependencies: [
                .product(name: "FeatherService", package: "feather-service")
            ]
        ),
        .target(
            name: "XCTFeatherPush",
            dependencies: [
                .target(name: "FeatherPush"),
            ],
            resources: [
                .copy("Assets/feather.png")
            ]
        ),
        .testTarget(
            name: "FeatherPushTests",
            dependencies: [
                .target(name: "FeatherPush"),
            ]
        ),
        .testTarget(
            name: "XCTFeatherPushTests",
            dependencies: [
                .target(name: "XCTFeatherPush"),
            ]
        ),
    ]
)
