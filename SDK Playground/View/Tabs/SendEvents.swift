//
//  SendEvents.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI
import AppsFlyerLib

func getRandomDouble() -> Double {
    return Double(round(100 * Double.random(in: 1..<100))/100)
}

struct SendEvents: View {
    @State private var purchaseValue: Double = getRandomDouble()
    @State private var subscribeValue: Double = getRandomDouble()
    @State private var redefinedValue: Double = getRandomDouble()
    @State private var customEventName: String = "Impacc"
    @State private var firstName: String = "Zark"
    @State private var lastName: String = "BabyRays"
    @State private var email: String = "impacc@example.com"
    @State private var phone: String = "(555) 010-2368"
    @State private var address: String = "924 Mason St"
    @State private var city: String = "San Francisco"
    @State private var state: String = "CA"
    @State private var zip: String = "94129"
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Standard Events")) {
                    EventButton(label: "AddToCart", trigger: {
                        AppsFlyerLib.shared().logEvent(AFEventAddToCart, withValues: [:]);
                    })
                    EventButton(label: "AddToWishlist", trigger: {
                        AppsFlyerLib.shared().logEvent(AFEventAddToCart, withValues: [:]);
                    })
                    EventButton(label: "InitiateCheckout", trigger: {
                        AppsFlyerLib.shared().logEvent(AFEventInitiatedCheckout, withValues: [:]);
                    })
                    EventButton(label: "ViewContent", trigger: {
                        AppsFlyerLib.shared().logEvent(AFEventContentView, withValues: [:]);
                    })
                    EventButton(label: "Purchase", value: purchaseValue, trigger: {
                        AppsFlyerLib.shared().logEvent(AFEventPurchase,
                          withValues: [
                             AFEventParamPrice: purchaseValue,
                             AFEventParamCurrency:"USD"
                        ]);
                        purchaseValue = getRandomDouble()
                    })
                    EventButton(label: "Subscribe", value: subscribeValue, trigger: {
                        AppsFlyerLib.shared().logEvent(AFEventSubscribe,
                          withValues: [
                             AFEventParamPrice: subscribeValue,
                             AFEventParamCurrency:"USD"
                        ]);
                        subscribeValue = getRandomDouble()
                    })
                }
                Section(header: Text("Custom Events")) {
                    EventButton(label: "Ping Zucc", trigger: {
                        AppsFlyerLib.shared().logEvent("Ping Zucc", withValues: [:]);
                    })
                    EventButton(label: "Redefined", value: redefinedValue, trigger: {
                        AppsFlyerLib.shared().logEvent("Redefined",
                          withValues: [
                             AFEventParamPrice: redefinedValue
                        ]);
                        redefinedValue = getRandomDouble()
                    })
                    CustomEventButton(value: customEventName, trigger: {
                        AppsFlyerLib.shared().logEvent(customEventName, withValues: [:]);
                    })
                }
                Section(header: Text("Advanced Matching")) {
                    HStack{
                        TextField("First Name", text: $firstName)
                        Divider()
                        TextField("Last Name", text: $lastName)
                    }
                    TextField("Address", text: $address)
                    HStack{
                        TextField("City", text: $city)
                        Divider()
                        GeometryReader { geometry in
                            HStack{
                                TextField("State", text: $state).frame(width: geometry.size.width * 0.35)
                                Divider()
                                TextField("ZIP Code", text: $zip)
                            }
                        }
                    }
                    TextField("Phone Number", text: $phone)
                    TextField("E-mail", text: $email)
                    EventButton(label: "Send for Advanced Matching", trigger: {})
                }
            }.navigationTitle(Tab.sendEvents.label)
        }
    }
}

struct SendEvents_Previews: PreviewProvider {
    static var previews: some View {
        SendEvents()
    }
}
