//
//  PushNotification.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 13.
//

/// The provider-neutral content and delivery options for a push notification.
public struct PushNotification: Sendable {
    /// The notification title.
    public let title: String
    /// The notification body.
    public let body: String
    /// Application-defined key-value data delivered with the notification.
    ///
    /// Providers may impose restrictions on keys and values. Reserved provider
    /// keys may be rejected by a concrete client.
    public let data: [String: String]
    /// Whether the notification should be presented or delivered silently.
    public let delivery: Delivery
    /// An optional deep link for the application to open when selected.
    public let deepLink: String?
    /// An optional image URL for providers that support rich notifications.
    public let imageURL: String?
    /// An optional badge value for the application icon.
    public let badge: Int?
    /// An optional sound for providers and platforms that support notification sounds.
    public let sound: Sound?
    /// An optional provider-specific identifier used to collapse equivalent notifications.
    public let collapseID: String?

    /// Creates a provider-neutral push notification.
    ///
    /// - Parameters:
    ///   - title: The notification title.
    ///   - body: The notification body.
    ///   - data: Application-defined data delivered with the notification.
    ///   - delivery: The requested presentation mode.
    ///   - deepLink: An optional application deep link.
    ///   - imageURL: An optional image URL for rich notifications.
    ///   - badge: An optional application badge value.
    ///   - sound: An optional notification sound.
    ///   - collapseID: An optional identifier for collapsing equivalent notifications.
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
