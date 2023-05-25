//
//  AppDelegate.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI
import AppTrackingTransparency
import AppsFlyerLib

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // AppDelegate didFinishLaunchingWithOptions
        AppsFlyerLib.shared().appsFlyerDevKey = "123e4567e89b12d3a45642"
        AppsFlyerLib.shared().appleAppID = "id3141592653"

        // AppsFlyerLib.shared().appInviteOneLinkID = "1234"

        // Subscribe to didBecomeActiveNotification
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didBecomeActiveNotification),
            name: UIApplication.didBecomeActiveNotification,
            object: nil)
        
        AppsFlyerLib.shared().waitForATTUserAuthorization(timeoutInterval: 60)
        
        return true
    }

    @objc func didBecomeActiveNotification() {
        // AppDelegate didBecomeActiveNotification
        AppsFlyerLib.shared().start()

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
                @unknown default:
                    fatalError("Invalid ATT authorization status")
                }
            }
        }
    }
}
