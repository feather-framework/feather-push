public import FeatherPush

/// An in-memory `PushClient` that captures notifications for tests.
public struct TestPushClient: Sendable {

    /// The actor-isolated state containing captured notifications.
    public let state: TestPushState

    /// Creates a test client using the supplied or a new state.
    public init(state: TestPushState = TestPushState()) {
        self.state = state
    }

    /// Returns captured notifications and their destinations in insertion order.
    public func getNotifications() async -> [(PushNotification, String)] {
        await state.getNotifications()
    }

    /// Removes all captured notifications.
    public func clearNotifications() async {
        await state.clear()
    }
}

extension TestPushClient: PushClient {

    /// Captures a notification for the supplied device token or topic.
    ///
    /// - Parameters:
    ///   - notification: The notification content and delivery options.
    ///   - target: The device token or topic to capture with the notification.
    /// - Throws: `PushClientError.invalidTopic` or
    ///   `PushClientError.invalidDeviceToken` if the target is empty.
    public func send(
        notification: PushNotification,
        to target: PushDeliveryTarget
    ) async throws(PushClientError) {
        switch target {
        case .topic(let topic):
            guard !topic.isEmpty else { throw .invalidTopic }
            await state.add(notification, destination: topic)
        case .deviceToken(let deviceToken):
            guard !deviceToken.isEmpty else { throw .invalidDeviceToken }
            await state.add(notification, destination: deviceToken)
        }
    }
}
