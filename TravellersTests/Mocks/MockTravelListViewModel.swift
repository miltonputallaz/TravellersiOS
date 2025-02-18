//
//  MockTravelListViewModel.swift
//  Travellers
//
//  Created by Milton Putallaz on 16/02/2025.
//
import Foundation
class MockTravelListViewModel: TravelListViewModelProtocol {
    @Published var uiState: TravelListUIState = TravelListUIState()
    
    @MainActor
    func setTravels(travels: [ExternalTravel]) {
        uiState.travels = travels
    }
    
}
