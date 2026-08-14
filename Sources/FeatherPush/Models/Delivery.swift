//
//  Delivery.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 13.
//

/// The delivery priority of a push notification.
public enum Delivery: String, Sendable {
    /// Delivers the notification normally.
    case normal
    /// Delivers the notification without presenting an alert.
    case silent
}
