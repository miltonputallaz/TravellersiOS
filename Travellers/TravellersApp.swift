//
//  TravellersApp.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import SwiftUI
import Resolver

@main
struct TravellersApp: App {
    @StateObject var themeManager = ThemeManager()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
        }
    }
}
