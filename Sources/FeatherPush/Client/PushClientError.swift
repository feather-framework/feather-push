//
//  PushClientError.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 14.
//

/// Provider-neutral errors that can occur while delivering a push notification.
public enum PushClientError: Error {

    /// The topic is empty or is not valid for the provider.
    case invalidTopic
    /// The device token is empty or is not valid for the provider.
    case invalidDeviceToken
    /// The notification payload is invalid or contains unsupported values.
    case invalidNotification
    /// The provider does not support the requested target type.
    case unsupportedTarget
    /// The provider credentials are invalid or the request is unauthorized.
    case unauthorized
    /// The provider temporarily rejected the request because it was rate limited.
    case rateLimited
    /// The provider is temporarily unavailable; retrying may succeed later.
    case unavailable
    /// The provider rejected the request with a descriptive reason.
    ///
    /// - Parameter reason: The provider-supplied rejection message.
    case rejected(String)
    /// An underlying error without a more specific provider-neutral mapping.
    ///
    /// - Parameter error: The underlying provider or transport error.
    case unknown(Error)
}
