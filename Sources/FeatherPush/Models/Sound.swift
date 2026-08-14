//
//  Sound.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 13.
//

/// The sound to play when a notification is presented.
public enum Sound: Sendable, Equatable {
    /// Use the platform default notification sound.
    case `default`
    /// Use a bundled, provider-specific sound name.
    case named(String)
}
