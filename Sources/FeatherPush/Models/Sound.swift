//
//  Sound.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 13.
//

/// A notification sound requested when a provider presents the notification.
public enum Sound: Sendable, Equatable {
    /// Use the platform default notification sound.
    case `default`
    /// Use a sound bundled with the target application.
    case named(String)
}
