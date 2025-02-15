//
//  RemoteRepository.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Alamofire

protocol RemoteRepository {
    func getDecodable<T: Decodable>(url: String, type: T.Type, headers: HTTPHeaders?) async throws -> T
    func post<T: Decodable>(url: String, parameters: [String: Any], type: T.Type, headers: HTTPHeaders?) async throws -> T
}
