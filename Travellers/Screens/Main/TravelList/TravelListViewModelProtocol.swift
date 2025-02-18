//
//  TravelListViewModelProtocol.swift
//  Travellers
//
//  Created by Milton Putallaz on 16/02/2025.
//

import Foundation

protocol TravelListViewModelProtocol: ObservableObject {
    var uiState: TravelListUIState { get }
}
