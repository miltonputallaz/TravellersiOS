//
//  LoginRemoteRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Alamofire

class LoginRemoteRepositoryImpl: LoginRemoteRepository {
    
    private var unauthRemoteRepository: UnauthRemoteRepository

    init(unauthRemoteRepository: UnauthRemoteRepository) {
        self.unauthRemoteRepository = unauthRemoteRepository
    }
    
    func login(email: String, password: String) async -> ResponseState<RemoteLoginResponse> {
        do {
            let params = ["username": email, "password": password]
            let headers: HTTPHeaders = [
                "Content-Type": "application/x-www-form-urlencoded"
            ]
            let result = try await unauthRemoteRepository.post(url: "\(EndpointConst.BASE_URL)\(EndpointConst.POST_LOGIN_ENDPOINT)", parameters: params, type: RemoteLoginResponse.self, headers: headers)
    
            return ResponseState.success(result)
        } catch(let exception) {
            return ResponseState.error(exception.localizedDescription)
        }
    }
}
