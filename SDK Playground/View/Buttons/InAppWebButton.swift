//
//  InAppWebButton.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI

struct InAppWebButton: View {
    @State private var isSheetPresented = false

    var label: String
    var url: String
    
    var body: some View {
        Button(label) {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented) {
            InAppWebSheet(url: URL(string: url)!)
        }
    }
}

struct InAppWebButton_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Section(header: Text("Preview")){
                InAppWebButton(label: "Test", url: "https://developers.facebook.com/docs/ios/")
            }
        }
    }
}
