// swift-tools-version:6.3
import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .swiftLanguageMode(.v6),
    .strictMemorySafety(),
    .treatAllWarnings(as: .error),
    .enableUpcomingFeature("InternalImportsByDefault"),
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("MemberImportVisibility"),
    .enableUpcomingFeature("InferIsolatedConformances"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
    .enableUpcomingFeature("ImmutableWeakCaptures"),
    .enableExperimentalFeature("SuppressedAssociatedTypes"),
    .enableExperimentalFeature("LifetimeDependence"),
    .enableExperimentalFeature("Lifetimes"),
    .enableUpcomingFeature("StrictConcurrency"),
]

let package = Package(
    name: "feather-push",
    platforms: [
        .macOS(.v15),
        .iOS(.v18),
        .tvOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2),
    ],
    products: [
        .library(name: "FeatherPush", targets: ["FeatherPush"]),
        .library(name: "FeatherPushTesting", targets: ["FeatherPushTesting"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FeatherPush",
            dependencies: [],
            swiftSettings: swiftSettings
        ),
        .target(
            name: "FeatherPushTesting",
            dependencies: [
                .target(name: "FeatherPush"),
            ],
            path: "Sources/FeatherPushTesting",
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "FeatherPushTests",
            dependencies: [
                .target(name: "FeatherPush"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "FeatherPushTestingTests",
            dependencies: [
                .target(name: "FeatherPush"),
                .target(name: "FeatherPushTesting"),
            ],
            swiftSettings: swiftSettings
        ),
    ]
)
