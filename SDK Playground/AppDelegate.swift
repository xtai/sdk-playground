//
//  AppDelegate.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI
import FacebookCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // AppDelegate didFinishLaunchingWithOptions
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        Settings.shared.isAdvertiserTrackingEnabled = true
        Settings.shared.isAutoLogAppEventsEnabled = true
        Settings.shared.isAdvertiserIDCollectionEnabled = true
        return true
    }
}
