//
//  ReadInfo.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleInfoDictionaryVersion") as? String
    }
    
    static let externalURLSchemes: [String] = {
        guard let urlTypes = Bundle.main.infoDictionary?["CFBundleURLTypes"] as? [[String: Any]] else {
            return []
        }

        var result: [String] = []
        for urlTypeDictionary in urlTypes {
            guard let urlSchemes = urlTypeDictionary["CFBundleURLSchemes"] as? [String] else { continue }
            guard let externalURLScheme = urlSchemes.first else { continue }
            result.append(externalURLScheme)
        }

        return result
     }()
    
    static var FacebookAppID: String {
        (Bundle.main.object(forInfoDictionaryKey: "FacebookAppID") as? String) ?? "Not Found"
    }
    
    static var FacebookDisplayName: String {
        (Bundle.main.object(forInfoDictionaryKey: "FacebookDisplayName") as? String) ?? "Not Found"
    }
    
    static var FacebookAutoLogAppEventsEnabled: String {
        if let value = Bundle.main.object(forInfoDictionaryKey: "FacebookAutoLogAppEventsEnabled") as? Bool {
            return String(value)
        } else {
            return "Not Found"
        }
    }
    
    static var FacebookAdvertiserIDCollectionEnabled: String {
        if let value = Bundle.main.object(forInfoDictionaryKey: "FacebookAdvertiserIDCollectionEnabled") as? Bool {
            return String(value)
        } else {
            return "Not Found"
        }
    }
}
