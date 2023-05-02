//
//  SendEvents.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/1/23.
//

import SwiftUI
import FacebookCore

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
                        AppEvents.shared.logEvent(AppEvents.Name.addedToCart)
                    })
                    EventButton(label: "AddToWishlist", trigger: {
                        AppEvents.shared.logEvent(AppEvents.Name.addedToWishlist)
                    })
                    EventButton(label: "InitiateCheckout", trigger: {
                        AppEvents.shared.logEvent(AppEvents.Name.initiatedCheckout)
                    })
                    EventButton(label: "ViewContent", trigger: {
                        AppEvents.shared.logEvent(AppEvents.Name.viewedContent)
                    })
                    EventButton(label: "Purchase", value: purchaseValue, trigger: {
                        AppEvents.shared.logPurchase(amount: purchaseValue, currency: "USD")
                        purchaseValue = getRandomDouble()
                    })
                    EventButton(label: "Subscribe", value: subscribeValue, trigger: {
                        AppEvents.shared.logEvent(AppEvents.Name.subscribe, valueToSum: subscribeValue)
                        subscribeValue = getRandomDouble()
                    })
                }
                Section(header: Text("Custom Events")) {
                    EventButton(label: "Ping Zucc", trigger: {
                        AppEvents.shared.logEvent(AppEvents.Name("Ping Zucc"))
                    })
                    EventButton(label: "Redefined", value: redefinedValue, trigger: {
                        AppEvents.shared.logEvent(AppEvents.Name("Redefined"), valueToSum: redefinedValue)
                        redefinedValue = getRandomDouble()
                    })
                    CustomEventButton(value: customEventName, trigger: {
                        AppEvents.shared.logEvent(AppEvents.Name(customEventName))
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
                    EventButton(label: "Update User Data", trigger: {
                        AppEvents.shared.setUserData(firstName, forType: .firstName)
                        AppEvents.shared.setUserData(lastName, forType: .lastName)
                        AppEvents.shared.setUserData(city, forType: .city)
                        AppEvents.shared.setUserData(state, forType: .state)
                        AppEvents.shared.setUserData(zip, forType: .zip)
                        AppEvents.shared.setUserData("1" + phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(), forType: .phone)
                        AppEvents.shared.setUserData(email, forType: .email)
                    })
                }
            }.navigationTitle(Tab.sendEvents.label).onAppear {
                print("Set for Advanced Matching on View Appear")
                AppEvents.shared.setUserData(firstName, forType: .firstName)
                AppEvents.shared.setUserData(lastName, forType: .lastName)
                AppEvents.shared.setUserData(city, forType: .city)
                AppEvents.shared.setUserData(state, forType: .state)
                AppEvents.shared.setUserData(zip, forType: .zip)
                AppEvents.shared.setUserData("1" + phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(), forType: .phone)
                AppEvents.shared.setUserData(email, forType: .email)
            }
        }
    }
}

struct SendEvents_Previews: PreviewProvider {
    static var previews: some View {
        SendEvents()
    }
}
