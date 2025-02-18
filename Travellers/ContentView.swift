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
    ContentView()
}
