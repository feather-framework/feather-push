//
//  Platform.swift
//  feather-push
//
//  Created by Binary Birds on 2026. 08. 13.
//

/// A platform supported by a push provider.
public enum Platform: Sendable, Equatable {
    /// Apple iPhone and iPad platform.
    case iOS
    /// Apple Mac platform.
    case macOS
    /// Apple TV platform.
    case tvOS
    /// Apple Watch platform.
    case watchOS
    /// Apple Vision Pro platform.
    case visionOS
    /// Safari web-push platform.
    case safari
    /// Android platform.
    case android
    /// Generic web-push platform.
    case web
    /// A provider-specific platform.
    case custom(String)
}
