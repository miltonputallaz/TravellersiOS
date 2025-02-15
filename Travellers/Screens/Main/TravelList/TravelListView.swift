//
//  TravelListVIew.swift
//  Travellers
//
//  Created by Milton Putallaz on 14/02/2025.
//



import SwiftUI
import Resolver

struct TravelListView: View {
    
    @StateObject var controller: TravelListViewModel = Resolver.resolve()
    @EnvironmentObject private var themeManager: ThemeManager
    @Binding var path: [MainDestinations]
    
    var body: some View {
        VStack {
            Button {
                //path.append(MainDestinations.AddTravel)
                
            } label: {
                Text("Go to add travel")
            }

        }
    }
    

}

#Preview {
    MainView()
}
