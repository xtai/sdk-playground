//
//  EventButton.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI

struct EventButton: View {
    @State private var count = 0
    
    var label: String
    var value: Double?
    let trigger: () -> Void

    var body: some View {
        HStack(){
            Button(action: {
                count += 1
                trigger()
                var debugMessage = "\(label)"
                if let value = value {
                    debugMessage += " $\(value)"
                }
                debugMessage += " ×\(count)"
                print(debugMessage)
            }) {
                HStack{
                    Text(label)
                    if let value = value {
                        Text("$\(String(format: "%.2f", value))").foregroundColor(Color.secondary)
                    }
                    Spacer()
                    if (count != 0) {
                        Text("×\(count)").foregroundColor(Color.secondary)
                    }
                }
            }
        }
    }
}

struct EventButton_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Section(header: Text("Preview")){
                EventButton(label: "Purchase", value: getRandomDouble(), trigger: {})
                EventButton(label: "ViewContent", trigger: {})
            }
        }
    }
}
