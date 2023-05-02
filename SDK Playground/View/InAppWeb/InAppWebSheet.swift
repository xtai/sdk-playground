//
//  InAppWebSheet.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI

struct InAppWebSheet: View {
    @Environment(\.dismiss) private var dismiss

    var url: URL

    var body: some View {
        NavigationStack {
            InAppWeb(url: url).toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Link(destination: url) { Image(systemName: "safari") }
                }
                ToolbarItemGroup(placement: .principal) {
                    Text(url.host()!).foregroundColor(Color.secondary)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Close") { dismiss() }
                }
            }
            .navigationBarTitleDisplayMode(.inline) 
            .ignoresSafeArea(.container, edges: [.bottom])
        }
    }
}

struct InAppWebSheet_Previews: PreviewProvider {
    static var previews: some View {
        InAppWebSheet(url: URL(string: "https://developers.facebook.com/docs/ios/")!)
    }
}
