//
//  PushNotification.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 13.
//

/// A push notification payload.
public struct PushNotification: Sendable {
    /// The notification title.
    public let title: String
    /// The notification body.
    public let body: String
    /// Provider-specific notification metadata.
    public let data: [String: String]
    /// The requested delivery priority.
    public let delivery: Delivery
    /// An optional deep link opened when the notification is selected.
    public let deepLink: String?
    /// An optional image URL supported by providers that render rich notifications.
    public let imageURL: String?
    /// An optional badge value for the application icon.
    public let badge: Int?
    /// An optional notification sound.
    public let sound: Sound?
    /// An optional identifier used to collapse equivalent notifications.
    public let collapseID: String?

    /// Creates a push notification.
    public init(
        title: String,
        body: String,
        data: [String: String] = [:],
        delivery: Delivery = .normal,
        deepLink: String? = nil,
        imageURL: String? = nil,
        badge: Int? = nil,
        sound: Sound? = nil,
        collapseID: String? = nil
    ) {
        self.title = title
        self.body = body
        self.data = data
        self.delivery = delivery
        self.deepLink = deepLink
        self.imageURL = imageURL
        self.badge = badge
        self.sound = sound
        self.collapseID = collapseID
    }
}
