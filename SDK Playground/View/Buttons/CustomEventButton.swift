//
//  CustomEventButton.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI

struct CustomEventButton: View {
    @State private var count = 0
    @State var value: String

    let trigger: () -> Void
    
    func triggers() {
        count += 1
        trigger()
        print("\(value) ×\(count)")
    }

    var body: some View {
        HStack(){
            TextField("Custom Event Name", text: $value).disableAutocorrection(true).textInputAutocapitalization(.never).submitLabel(.send).onSubmit {
                triggers()
            }
            Spacer()
            Button(action: {
                triggers()
            }) {
                HStack(){
                    Text("Send")
                    if (count != 0) {
                        Text("×\(count)").foregroundColor(Color.secondary)
                    }
                }
            }
            
        }
    }
}

struct CustomEventButton_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Section(header: Text("Preview")){
                CustomEventButton(value: "Impacc", trigger: {})
            }
        }
    }
}
