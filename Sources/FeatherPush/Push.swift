//
//  Push.swift
//  FeatherPush
//
//  Created by Tibor Bodecs on 2023. 01. 16..
//

public enum Delivery: String, Sendable {
    case normal
    case silent
}

public enum Platform: Sendable {
    case iOS
    case macOS
    case tvOS
    case watchOS
    case visionOS
    case safari
    case android
    case web
    case custom(String)
}

public struct Recipient: Sendable {
    public let token: String
    public let platform: Platform

    public init(
        token: String,
        platform: Platform
    ) {
        self.token = token
        self.platform = platform
    }
}

public struct Notification: Sendable {
    public let title: String
    public let body: String
    public let userInfo: [String: String]
    public let delivery: Delivery

    public init(
        title: String,
        body: String,
        userInfo: [String: String] = [:],
        delivery: Delivery = .normal
    ) {
        self.title = title
        self.body = body
        self.userInfo = userInfo
        self.delivery = delivery
    }
}
