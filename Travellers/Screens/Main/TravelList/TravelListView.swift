//
//  TravelListVIew.swift
//  Travellers
//
//  Created by Milton Putallaz on 14/02/2025.
//



import SwiftUI
import Resolver

struct TravelListView <VM: TravelListViewModelProtocol>: View {
    
    @StateObject var viewModel: VM = Resolver.resolve()
    @EnvironmentObject private var themeManager: ThemeManager
    @Binding var path: [MainDestinations]
    
    
    var body: some View {
        List {
            ForEach(viewModel.uiState.travels, id: \.id) { travel in
                TravelCardItem(travel: travel)
                    .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 0))
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        path.append(MainDestinations.AddTravel(travel: travel))
                    }
            }
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    path.append(MainDestinations.AddTravel())
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }

}

#Preview {
    
    Resolver.setupMockMode()
    Resolver.mock.register { MockTravelListViewModel() }.implements((any TravelListViewModelProtocol).self)

    var travelListViewModel: MockTravelListViewModel = Resolver.mock.resolve()
    
    travelListViewModel.setTravels(travels: [ExternalTravel(title: "Titulo", description: nil, id: "id", owner: true, imageId: ImageManager.POSSIBLE_DEFAULT_IMAGES[0]), ExternalTravel(title: "Titulo", description: nil, id: "id", owner: true, imageId: ImageManager.POSSIBLE_DEFAULT_IMAGES[0])])
    
    return TravelListView(viewModel: travelListViewModel, path: .constant([])).environmentObject(ThemeManager())
}
