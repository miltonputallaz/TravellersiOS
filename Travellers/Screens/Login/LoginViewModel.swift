//
//  LoginViewModel.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Foundation

struct LoginUIState {
    var username: String = ""
    var password: String = ""
    var loading: Bool = false
}

class LoginViewModel: ObservableObject {
    
    var loginRepository: LoginRepository
    
    @Published var uiState = LoginUIState()
    
    init(
        loginRepository: LoginRepository
    ){
        self.loginRepository = loginRepository
    }
    
    func login() async {
        await updateLoading(loading: true)
        let result = await loginRepository.login(email: uiState.username, password: uiState.password)
        await updateLoading(loading: false)
    }
    
    @MainActor
    private func updateLoading(loading: Bool) {
        uiState.loading = loading
    }
}
