//
//  AlternativeIcons.swift
//  SDK Playground
//
//  Created by Sean Tai on 5/24/23.
//

import SwiftUI

struct AlternativeIcons: View {
    var body: some View {
        Section("Alternative Icon") {
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(AppIcon.allCases) { appIcon in
                        Image(uiImage: UIImage(named: appIcon.rawValue) ?? UIImage())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.secondary, lineWidth: 0.25))
                            .onTapGesture {
                                withAnimation {
                                    updateAppIcon(to: appIcon)
                                }
                            }
                    }
                }
                .padding(16)
            }.listRowInsets(EdgeInsets())
        }
    }
    func updateAppIcon(to icon: AppIcon) {
        Task { @MainActor in
            guard UIApplication.shared.alternateIconName != icon.iconName else {
                return
            }
            do {
                try await UIApplication.shared.setAlternateIconName(icon.iconName)
            } catch {
                print("Updating icon to \(String(describing: icon.iconName)) failed.")
            }
        }
    }
}

struct AlternativeIcons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List {
                AlternativeIcons()
            }
        }
    }
}
