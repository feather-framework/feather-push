//
//  PushClient.swift
//  feather-push
//
//  Created by Tibor Bodecs on 2023. 01. 16.
//

/// A client capable of delivering push notifications.
public protocol PushClient: Sendable {

    /// Sends a push notification to the given recipients.
    ///
    /// - Parameters:
    ///   - notification: The notification to deliver.
    ///   - topic: The topic that receives the notification.
    /// - Throws: `PushClientError` when delivery fails.
    func send(
        notification: PushNotification,
        to topic: String
    ) async throws(PushClientError)
}
