//
//  PushClient.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 14.
//

/// A provider-neutral client capable of delivering notifications to devices.
///
/// Providers identify devices differently. The `deviceToken` value must be
/// supplied in the format expected by the provider implementation.
///
/// Implementations may support additional delivery capabilities through more
/// specialized protocols, such as ``TopicPushClient``.
public protocol PushClient: Sendable {
    /// Sends a notification to one device.
    ///
    /// - Parameters:
    ///   - notification: The notification content and delivery options.
    ///   - deviceToken: The provider-issued token identifying the device.
    /// - Throws: A ``PushClientError`` when the notification cannot be sent.
    func sendToDevice(
        notification: PushNotification,
        deviceToken: String
    ) async throws(PushClientError)
}
