//
//  PushService.swift
//  FeatherPush
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

import FeatherService

/// the push service protocol
public protocol PushService: Service {

    /// send a push notification to a given recipients
    func send(notification: Notification, to: [Recipient]) async throws
}
