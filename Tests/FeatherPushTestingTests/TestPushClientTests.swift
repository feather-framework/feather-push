import FeatherPush
import FeatherPushTesting
import Testing

@Suite
struct TestPushClientTests {

    @Test
    func sendCapturesNotificationsAndDestinationsInOrder() async throws {
        let state = TestPushState()
        let client = TestPushClient(state: state)
        let first = PushNotification(title: "First", body: "Body")
        let second = PushNotification(title: "Second", body: "Body")

        try await client.send(notification: first, to: .topic("news"))
        try await client.send(
            notification: second,
            to: .deviceToken("device-token")
        )

        let captured = await state.getNotifications()
        #expect(captured.count == 2)
        #expect(captured[0].0.title == "First")
        #expect(captured[0].1 == "news")
        #expect(captured[1].0.title == "Second")
        #expect(captured[1].1 == "device-token")
    }

    @Test
    func sendRejectsEmptyTopicWithoutCapturingNotification() async {
        let client = TestPushClient()

        do {
            try await client.send(
                notification: PushNotification(title: "Title", body: "Body"),
                to: .topic("")
            )
        }
        catch .invalidTopic {
            // Expected error.
        }
        catch {
            Issue.record("Unexpected error: \(error)")
        }
        #expect(await client.getNotifications().isEmpty)
    }

    @Test
    func sendRejectsEmptyDeviceTokenWithoutCapturingNotification() async {
        let client = TestPushClient()

        do {
            try await client.send(
                notification: PushNotification(title: "Title", body: "Body"),
                to: .deviceToken("")
            )
        }
        catch .invalidDeviceToken {
            // Expected error.
        }
        catch {
            Issue.record("Unexpected error: \(error)")
        }
        #expect(await client.getNotifications().isEmpty)
    }

    @Test
    func clearNotificationsRemovesCapturedNotifications() async throws {
        let client = TestPushClient()
        try await client.send(
            notification: PushNotification(title: "Title", body: "Body"),
            to: .topic("news")
        )

        await client.clearNotifications()

        #expect(await client.getNotifications().isEmpty)
    }
}
