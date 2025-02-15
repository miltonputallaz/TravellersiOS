//
//  ContentView.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import SwiftUI
import CoreData
import Resolver

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var sessionManager: SessionManager
 
    var body: some View {
        Group {
            if sessionManager.isAuthenticated {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
