//
//  PushClientError.swift
//  feather-push
//
//  Created by Tibor Bodecs on 2023. 01. 16.
//

/// Errors that can occur while delivering a push notification.
public enum PushClientError: Error {

    /// The topic is empty or otherwise invalid.
    case invalidTopic
    /// The notification payload is invalid or cannot be delivered.
    case invalidNotification
    /// The provider credentials or authorization are invalid.
    case unauthorized
    /// The provider temporarily rejected the request because it was rate-limited.
    case rateLimited
    /// The provider is temporarily unavailable.
    case unavailable
    /// The provider rejected the request with a descriptive reason.
    case rejected(String)
    /// An underlying provider error that does not have a more specific mapping.
    case unknown(Error)
}
