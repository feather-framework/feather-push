//
//  PushDeliveryTarget.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 19.
//

/// A destination used when sending a push notification.
///
/// The meaning and availability of each target is provider-specific. A topic
/// may represent a group of subscribed devices for one provider, while another
/// provider may use its topic value only to identify an application.
public enum PushDeliveryTarget: Sendable, Equatable {
    /// A provider-issued token identifying a single device.
    case deviceToken(String)
    /// A provider-managed topic identifying a destination group or service.
    case topic(String)
}
