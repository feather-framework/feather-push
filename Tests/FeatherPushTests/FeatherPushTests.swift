//
//  FeatherPushTests.swift
//  feather-push
//
//  Created by Tibor Bodecs on 2023. 01. 16.
//

import FeatherPush
import Testing

@Suite
struct FeatherPushTests {

    @Test
    func notificationDefaults() {
        let notification = PushNotification(
            title: "Title",
            body: "Body"
        )

        #expect(notification.data.isEmpty)
        #expect(notification.delivery == .normal)
        #expect(notification.deepLink == nil)
        #expect(notification.badge == nil)
    }

    @Test
    func notificationSupportsDeepLinksAndProviderMetadata() {
        let notification = PushNotification(
            title: "New item",
            body: "Open the item",
            data: ["itemID": "123"],
            deepLink: "myapp://items/123",
            imageURL: "https://example.com/image.png",
            badge: 1,
            sound: .default,
            collapseID: "item-123"
        )

        #expect(notification.data["itemID"] == "123")
        #expect(notification.deepLink == "myapp://items/123")
        #expect(notification.sound == .default)
        #expect(notification.collapseID == "item-123")
    }

    @Test
    func clientErrorsExposeProviderNeutralCases() {
        let errors: [PushClientError] = [
            .invalidTopic,
            .invalidNotification,
            .unauthorized,
            .rateLimited,
            .unavailable,
            .rejected("provider rejected the request"),
        ]

        #expect(errors.count == 6)
    }
}
