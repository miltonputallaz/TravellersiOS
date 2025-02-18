//
//  TravelListViewModel.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//

import Foundation
import Resolver


class TravelListViewModel: TravelListViewModelProtocol {
    @Injected var travelsRepository: TravelsRepository
    @Published var uiState = TravelListUIState()
    
    init() {
        Task {
            
            let res = await travelsRepository.getTravels()
            switch res {
            case .success(let travels):
                await updateTravels(travels)
            case .error:
                break
            }
        }
    }
    
    @MainActor
    private func updateTravels(_ travels: [ExternalTravel]) {
        self.uiState.travels = travels
    }
}
