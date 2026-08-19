//
//  Delivery.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 13.
//

/// The requested presentation mode for a push notification.
public enum Delivery: String, Sendable {
    /// Delivers a notification that may be presented to the user.
    case normal
    /// Delivers notification data without requesting a visible alert.
    case silent
}
