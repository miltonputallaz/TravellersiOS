//
//  LoginRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

class LoginRepositoryImpl: LoginRepository {
    
    var loginRemoteRepository: LoginRemoteRepository
    
    init(
        loginRemoteRepository: LoginRemoteRepository
    ) {
        self.loginRemoteRepository = loginRemoteRepository
    }
    
    func login(email: String, password: String) async -> ResponseState<LoginResponse> {
        let result = await loginRemoteRepository.login(email: email, password: password)
        
        return result
    }
    
    
}
