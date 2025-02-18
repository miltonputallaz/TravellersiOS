//
//  MainViewModel.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Foundation

struct MainUIState {
    var loading: Bool = false
}


class MainViewModel: ObservableObject {
    
    private var sessionManager: SessionManager
    
    @Published var uiState = MainUIState()
    
    init(
        sessionManager: SessionManager
    ){
        self.sessionManager = sessionManager
    }
    
    @MainActor
    private func updateLoading(loading: Bool) {
        uiState.loading = loading
    }
    
    func logout() {
        Task {
            
            do {
                try await sessionManager.logout()
            } catch {
                
            }
        }
        
    }
}
