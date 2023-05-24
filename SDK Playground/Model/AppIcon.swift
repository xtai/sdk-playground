//
//  AppIcon.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/24/23.
//

import Foundation
import UIKit

enum AppIcon: String, CaseIterable, Identifiable {
    case primary = "AppIcon-Blueprint"
    case blue = "AppIcon-Blue"
    // case blueprint = "AppIcon-Blueprint"
    case green = "AppIcon-Green"
    case red = "AppIcon-Red"
    case yellow = "AppIcon-Yellow"
    case gray = "AppIcon-Gray"
    case dark = "AppIcon-Dark"

    var id: String { rawValue }

    var iconName: String? {
        switch self {
        case .primary:
            return nil
        default:
            return rawValue
        }
    }
}
