//
//  SDKPlaygroundApp.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI

@main
struct SDKPlaygroundApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var appData: AppData = .init()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appData).onOpenURL { url in
                // Deep link URL detected
                appData.deepLinkContent = url.absoluteString
                print("Deep Link opened: \(url.absoluteString)")
                
                // Open tab via deep link
                for component in url.query!.components(separatedBy: "&") {
                    if component.contains("tab=") {
                        let tabRawValue = component.replacingOccurrences(of: "tab=", with: "")
                        if let requestedTab = Tab.convert(from: tabRawValue) {
                            appData.activeTab = requestedTab
                        }
                    }
                }
            }
        }
    }
}
