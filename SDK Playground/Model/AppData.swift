//
//  AppData.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI

class AppData: ObservableObject {
    @Published var activeTab: Tab = .sendEvents
    @Published var deepLinkContent: String = ""
    @State private var showWebView = false
}
