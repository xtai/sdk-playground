//
//  ContentView.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appData: AppData
    
    var body: some View {
        TabView(selection: $appData.activeTab) {
            SendEvents().tag(Tab.sendEvents).tabItem {
                Label(Tab.sendEvents.label, systemImage: Tab.sendEvents.symbolImage)
            }
            DeepLink().tag(Tab.deepLink).tabItem {
                Label(Tab.deepLink.label, systemImage: Tab.deepLink.symbolImage)
            }
            About().tag(Tab.about).tabItem {
                Label(Tab.about.label, systemImage: Tab.about.symbolImage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppData())
    }
}
