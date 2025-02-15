//
//  MainView.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

//
//  LoginView.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//
import SwiftUI
import Resolver


struct MainView: View {
    @State private var path: [MainDestinations] = []
    
    @StateObject var controller: MainViewModel = Resolver.resolve()
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        NavigationStack(path: $path) {
            TravelListView(path: $path)
            .navigationDestination(for: MainDestinations.self) { screen in
            
                switch screen {
                case .AddTravel:
                    AddTravelView()
                }
          }
      }
        
    }
    

}

#Preview {
    MainView()
}
