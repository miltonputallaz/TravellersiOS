//
//  LoginRepository.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

protocol LoginRepository {
    func login(email: String, password: String) async -> ResponseState<RemoteLoginResponse>
}
