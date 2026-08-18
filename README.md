# Feather Push

An abstract push notification client for Feather CMS.

[![Release: 1.0.0-beta.2](https://img.shields.io/badge/Release-1%2E0%2E0--beta%2E2-F05138)](https://github.com/feather-framework/feather-push/releases/tag/1.0.0-beta.2)

## Features

- Topic- and device-token-based push notification delivery
- Silent and normal delivery modes
- Deep-link and rich notification metadata
- Badge, sound, and notification collapsing support
- Provider-neutral client and error APIs

## Requirements

![Swift 6.1+](https://img.shields.io/badge/Swift-6%2E1%2B-F05138)
![Platforms: Linux, macOS, iOS, tvOS, watchOS, visionOS](https://img.shields.io/badge/Platforms-Linux_%7C_macOS_%7C_iOS_%7C_tvOS_%7C_watchOS_%7C_visionOS-F05138)

- Swift 6.1+
- Platforms:
  - Linux
  - macOS 15+
  - iOS 18+
  - tvOS 18+
  - watchOS 11+
  - visionOS 2+

## Installation

Use Swift Package Manager; add the dependency to your `Package.swift` file:

```swift
.package(url: "https://github.com/feather-framework/feather-push", exact: "1.0.0-beta.2"),
```

Then add `FeatherPush` to your target dependencies:

```swift
.product(name: "FeatherPush", package: "feather-push"),
```

## Usage

[![DocC API documentation](https://img.shields.io/badge/DocC-API_documentation-F05138)](https://feather-framework.github.io/feather-push/)

API documentation is available at the following link.

`PushClient` provides device-token delivery. Providers that support topic
delivery additionally conform to `TopicPushClient`.

The capabilities are separated because push providers do not all support the
same targeting model. For example, FCM supports subscribable topics, while
APNs delivers to device tokens and uses its topic value to identify the
application rather than a group of subscribers.

```swift
let notification = PushNotification(
    title: "New message",
    body: "You have a new message.",
    data: ["messageID": "123"],
    deepLink: "myapp://messages/123",
    badge: 1,
    sound: .default
)

// Works with every PushClient implementation.
func sendToDevice(using client: some PushClient) async throws {
    try await client.sendToDevice(
        notification: notification,
        deviceToken: "device-registration-token"
    )
}
```

Topic-capable clients can also send to provider-managed topics:

```swift
// Requires a TopicPushClient implementation, such as FCM.
func sendToTopic(using client: some TopicPushClient) async throws {
    try await client.sendToTopic(
        notification: notification,
        topic: "messages"
    )
}
```

> [!WARNING]
> This repository is a work in progress, things can break until it reaches v1.0.0.

## Push implementations

The following push client implementations are available for use:

- [Feather Push APNS](https://github.com/feather-framework/feather-push-apns)
- [Feather Push FCM](https://github.com/feather-framework/feather-push-fcm)
- [Feather Push Ephemeral](https://github.com/feather-framework/feather-push-ephemeral)

## Development

- Build: `swift build`
- Test:
  - local: `make test`
  - using Docker: `make docker-test`
- Format: `make format`
- Check: `make check`

## Contributing

[Pull requests](https://github.com/feather-framework/feather-push/pulls) are welcome. Please keep changes focused and include tests for new logic.
