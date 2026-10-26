public import FeatherPush

/// Actor-isolated notification storage used by `TestPushClient`.
public actor TestPushState {

    private var notifications: [(PushNotification, String)] = []

    /// Creates an empty test state.
    public init() {}

    /// Returns captured notifications and their destinations in insertion order.
    public func getNotifications() -> [(PushNotification, String)] {
        notifications
    }

    /// Removes all captured notifications.
    public func clear() {
        notifications.removeAll()
    }

    func add(_ notification: PushNotification, destination: String) {
        notifications.append((notification, destination))
    }
}
