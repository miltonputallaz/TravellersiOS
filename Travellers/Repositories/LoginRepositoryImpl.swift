//
//  LoginRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//
import KeychainAccess
class LoginRepositoryImpl: LoginRepository {
    
    private var loginRemoteRepository: LoginRemoteRepository
    private var sessionManager: SessionManager
    
    private let keychain = Keychain(service: SecurityKeys.JWT_KEYCHAIN_SERVICE)
    
    init(
        loginRemoteRepository: LoginRemoteRepository,
        sessionManager: SessionManager
    ) {
        self.loginRemoteRepository = loginRemoteRepository
        self.sessionManager = sessionManager
    }
    
    func login(email: String, password: String) async -> ResponseState<RemoteLoginResponse> {
        let result = await loginRemoteRepository.login(email: email, password: password)
        switch result {
            case .success(let loginResponse):
                do {
                    try keychain.set(loginResponse.token, key: SecurityKeys.TOKEN_KEY)
                    // Notify session manager
                    await sessionManager.checkAuthentication()
                    return ResponseState.success(loginResponse)
                } catch {
                    return ResponseState.error("Error saving token to keychain")
                }
                
        case .error(let error):
            return ResponseState.error(error)
        }
    }
    
    
}
