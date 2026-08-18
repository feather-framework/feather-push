//
//  TopicPushClient.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 18.
//

/// A push client that supports provider-managed topic delivery.
///
/// Topic semantics are provider-specific. For example, an FCM topic can target
/// subscribed devices, while an APNs topic identifies an application and does
/// not replace a device token.
public protocol TopicPushClient: PushClient {

    /// Sends a notification to all devices subscribed to the topic.
    ///
    /// - Parameters:
    ///   - notification: The notification content and delivery options.
    ///   - topic: The provider-managed topic name.
    /// - Throws: A ``PushClientError`` when the topic or notification is invalid
    ///   or the provider rejects the request.
    func sendToTopic(
        notification: PushNotification,
        topic: String
    ) async throws(PushClientError)
}
