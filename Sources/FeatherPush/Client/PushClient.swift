//
//  PushClient.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 14.
//

/// A provider-neutral client capable of delivering notifications to supported targets.
///
/// The target determines how the provider should route the notification. A
/// provider that does not support a target should throw
/// ``PushClientError/unsupportedTarget``.
public protocol PushClient: Sendable {
    /// Sends a notification to the specified delivery target.
    ///
    /// - Parameters:
    ///   - notification: The notification content and delivery options.
    ///   - target: A device token or provider-managed topic.
    /// - Throws: A ``PushClientError`` when the notification cannot be sent.
    func send(
        notification: PushNotification,
        to target: PushDeliveryTarget
    ) async throws(PushClientError)
}
