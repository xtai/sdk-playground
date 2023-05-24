//
//  About.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI

struct About: View {
    var body: some View {
        NavigationStack {
            List {
                Section("") {
                    VStack(alignment: .leading) {
                        Text("App Version")
                        Text(String(UIApplication.appVersion!)).foregroundColor(Color.secondary)
                    }
                    VStack(alignment: .leading) {
                        Text("Valid URL Schemes")
                        Text(UIApplication.externalURLSchemes.joined(separator: ", ")).foregroundColor(Color.secondary)
                    }
                }
                AlternativeIcons()
                Section("Facebook SDK") {
                    VStack(alignment: .leading) {
                        Text("SDK Version")
                        let sdkVersion = "Not Installed"
                        // let sdkVersion = Settings.shared.sdkVersion
                        Text(sdkVersion).foregroundColor(Color.secondary)
                    }
                    VStack(alignment: .leading) {
                        Text("Facebook App ID")
                        Text(String(UIApplication.FacebookAppID)).foregroundColor(Color.secondary)
                    }
                    VStack(alignment: .leading) {
                        Text("Facebook App Display Name")
                        Text(String(UIApplication.FacebookDisplayName)).foregroundColor(Color.secondary)
                    }
                    VStack(alignment: .leading) {
                        Text("Advertiser ID Collection")
                        Text(String(UIApplication.FacebookAdvertiserIDCollectionEnabled)).foregroundColor(Color.secondary)
                    }
                    VStack(alignment: .leading) {
                        Text("Auto Log App Events")
                        Text(String(UIApplication.FacebookAutoLogAppEventsEnabled)).foregroundColor(Color.secondary)
                    }
                }
                Section("App Events") {
                    Text("To test App Events for Meta, you must first install and configure SDK from Meta or Mobile Measurement Partner.").foregroundColor(Color.secondary)
                    InAppWebButton(label: "About app events", url: "https://www.facebook.com/business/help/235457266642587")
                }
                Section("Meta Pixel") {
                    InAppWebButton(label: "Pixel Playground", url: "https://pixel.seantai.com/")
                }
                Section("SDK Playground App") {
                    VStack(alignment: .leading, spacing: 12.0){
                        Text("📱 🛝").font(.title3)
                        Text("SDK Playground v\(String(UIApplication.appVersion!))")
                    }
                    .padding(.vertical, 12.0)
                    InAppWebButton(label: "Source Code", url: "https://github.com/xtai/sdk-playground")
                    InAppWebButton(label: "Designed & Built by Sean", url: "https://instagram.com/xiaoyu.tai")
                }
            }.navigationTitle(Tab.about.label)
        }
    }
}

struct SDKInfo_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
