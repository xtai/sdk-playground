//
//  InAppWeb.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI
import WebKit
 
struct InAppWeb: UIViewRepresentable {
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct InAppWeb_Previews: PreviewProvider {
    static var previews: some View {
        InAppWeb(url: URL(string: "https://developers.facebook.com/docs/ios/")!)
    }
}
