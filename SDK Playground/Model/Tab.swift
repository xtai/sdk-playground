//
//  Tab.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case sendEvents = "sendEvents"
    case deepLink = "deepLink"
    case about = "about"
    
    var symbolImage: String {
        switch self {
        case .sendEvents: return "paperplane.fill"
        case .deepLink: return "app.connected.to.app.below.fill"
        case .about: return "info.circle.fill"
        }
    }
    
    var label: String {
        switch self {
        case .sendEvents: return "Send Events"
        case .deepLink: return "Test Deep Link"
        case .about: return "About"
        }
    }
    
    static func convert(from: String) -> Self? {
        return Tab.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
