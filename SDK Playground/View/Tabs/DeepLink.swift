//
//  DeepLink.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct DeepLink: View {
    @EnvironmentObject private var appData: AppData
    
    var body: some View {
        NavigationStack {
            List {
                Section("Detected Deep Link") {
                    if (appData.deepLinkContent != "") {
                        Text(appData.deepLinkContent)
                        Button(action: {
                            UIPasteboard.general.setValue(appData.deepLinkContent,
                                forPasteboardType: UTType.plainText.identifier)
                        }){
                            Text("Copy URL")
                        }
                    } else {
                        Text("Deep link appears here when App is opened through supported URL scheme").foregroundColor(Color.secondary)
                    }
                }
                Section("Test Deep Link") {
                    InAppWebButton(label: "Pixel Playground", url: "https://pixel.seantai.com/#deeplink")
                }
                Section() {
                    Link("sdkpark://zucc?tab=deepLink", destination: URL(string: "sdkpark://zucc?tab=deepLink")!)
                    Link("sdkpg://impacc?tab=sendEvents", destination: URL(string: "sdkpg://impacc?tab=sendEvents")!)
                    Link("sdkpg://?tab=about&id=2023", destination: URL(string: "sdkpg://?tab=about&id=2023")!)
                    Link("sdkpark://?tab=invalid", destination: URL(string: "sdkpark://?tab=invalid")!)
                }
                Section("Info.plist") {
                    VStack(alignment: .leading) {
                        Text("Valid URL Schemes")
                        Text(UIApplication.externalURLSchemes.joined(separator: ", ")).foregroundColor(Color.secondary)
                    }
                }
                Section("Facebook SDK") {
                    Text("A deep link is a link that goes directly to a specific piece of content within your app.").foregroundColor(Color.secondary)
                    InAppWebButton(label: "Add Deep Links", url: "https://developers.facebook.com/docs/app-ads/deep-linking/")
                }
            }.navigationTitle(Tab.deepLink.label)
        }
    }
}

struct DeepLink_Previews: PreviewProvider {
    static var previews: some View {
        DeepLink().environmentObject(AppData())
    }
}
