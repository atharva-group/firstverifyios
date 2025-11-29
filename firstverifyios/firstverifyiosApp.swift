//
//  firstverifyiosApp.swift
//  firstverifyios
//
//  Created by Atharva Arya on 29/11/25.
//

import SwiftUI

@main
struct firstverifyiosApp: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.fvBackground)
        
        // Use General Sans for titles if available, otherwise fallback
        let titleFont = UIFont(name: "GeneralSans-Bold", size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .bold)
        let largeTitleFont = UIFont(name: "GeneralSans-Bold", size: 34) ?? UIFont.systemFont(ofSize: 34, weight: .bold)
        
        appearance.titleTextAttributes = [
            .font: titleFont,
            .foregroundColor: UIColor(Color.fvHeading)
        ]
        
        appearance.largeTitleTextAttributes = [
            .font: largeTitleFont,
            .foregroundColor: UIColor(Color.fvHeading)
        ]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
