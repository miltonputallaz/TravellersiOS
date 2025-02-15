//
//  LoginControllerImpl.swift
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
        print("Main initied")
        self.sessionManager = sessionManager
    }
    
    deinit {
        print("Main deinitied")
    }
    
    @MainActor
    private func updateLoading(loading: Bool) {
        uiState.loading = loading
    }
    
    func logout() async {
        await sessionManager.logout()
    }
}
