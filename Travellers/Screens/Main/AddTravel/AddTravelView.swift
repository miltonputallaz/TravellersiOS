//
//  AddTravelView.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//

import SwiftUI
import Resolver

struct AddTravelView: View {
    
    @StateObject var controller: AddTravelViewModel = Resolver.resolve()
    
    var body: some View {
        Text("Add Travel")
    }
}
