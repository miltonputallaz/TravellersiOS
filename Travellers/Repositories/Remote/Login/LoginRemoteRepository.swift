//
//  LoginRemoteRepository.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

protocol LoginRemoteRepository {
    func login(email: String, password: String) async -> ResponseState<LoginResponse>
}
