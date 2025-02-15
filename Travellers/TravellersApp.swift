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
    let persistenceController = PersistenceController.shared
    @StateObject var themeManager = ThemeManager()
    @InjectedObject var sessionManager: SessionManager
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(themeManager)
                .environmentObject(sessionManager)
        }
    }
}
