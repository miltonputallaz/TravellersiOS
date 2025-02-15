//
//  LoginRemoteRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Alamofire
import KeychainAccess

class LoginRemoteRepositoryImpl: LoginRemoteRepository {
    
    private var remoteRepository: RemoteRepository
    private let sessionManager: SessionManager

    private let keychain = Keychain(service: "com.sani.corporation.travellers")
        

    init(remoteRepository: RemoteRepository, sessionManager: SessionManager) {
        self.remoteRepository = remoteRepository
        self.sessionManager = sessionManager
    }
    
    func login(email: String, password: String) async -> ResponseState<LoginResponse> {
        do {
            let params = ["username": email, "password": password]
            let headers: HTTPHeaders = [
                "Content-Type": "application/x-www-form-urlencoded"
            ]
            let result = try await remoteRepository.post(url: "http://0.0.0.0:8000/api/v1/login/access-token", parameters: params, type: LoginResponse.self, headers: headers)
            try keychain.set(result.token, key: "auth_token")
            // Notify session manager
            await sessionManager.checkAuthentication()
            return ResponseState.success(result)
        } catch(let exception) {
            return ResponseState.error(exception.localizedDescription)
        }
    }
}
