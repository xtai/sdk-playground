//
//  AppDelegate.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI
import FacebookCore
import AppTrackingTransparency

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // AppDelegate didFinishLaunchingWithOptions
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        Settings.shared.isAutoLogAppEventsEnabled = true
        Settings.shared.isAdvertiserIDCollectionEnabled = true
                
        // Subscribe to didBecomeActiveNotification
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didBecomeActiveNotification),
            name: UIApplication.didBecomeActiveNotification,
            object: nil)
        return true
    }

    @objc func didBecomeActiveNotification() {
        // AppDelegate didBecomeActiveNotification
        // code...

        // AppTrackingTransparency
        if #available(iOS 14, *) {
            print("Checking ATT authorization")
            ATTrackingManager.requestTrackingAuthorization { (status) in
                switch status {
                case .denied:
                    print("ATT authorization status is denied")
                case .notDetermined:
                    print("ATT authorization status is notDetermined")
                case .restricted:
                    print("ATT authorization status is restricted")
                case .authorized:
                    print("ATT authorization status is authorized")
                    Settings.shared.isAdvertiserTrackingEnabled = true
                @unknown default:
                    fatalError("Invalid ATT authorization status")
                }
            }
        }
    }
}
