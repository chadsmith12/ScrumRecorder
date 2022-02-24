//
//  Theme.swift
//  ScrumRecorder
//
//  Created by Chad Smith on 2/23/22.
//

import SwiftUI

/// Represents all the themes in the application, and the current theme the application is using
enum Theme: String {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    /// Provides the accent color for the theme.
    /// This will either be black or white based off the theme
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow:
            return .black
        case .indigo, .magenta, .navy, .oxblood, .purple:
            return .white
        }
    }
    
    /// Provides a Color based off the current theme
    var mainColor: Color {
        Color(rawValue)
    }
    
    /// Provides a captialized version of the theme as the name
    var name: String {
        rawValue.capitalized
    }
}
