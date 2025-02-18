//
//  UnauthRemoteRepository.swift
//  Travellers
//
//  Created by Milton Putallaz on 17/02/2025.
//
import Alamofire

protocol UnauthRemoteRepository {
    func post<T: Decodable>(url: String, parameters: [String: Any], type: T.Type, headers: HTTPHeaders?) async throws -> T
}

