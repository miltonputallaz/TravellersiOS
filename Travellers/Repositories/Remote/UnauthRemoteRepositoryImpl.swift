//
//  RemoteRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//
import Alamofire

class UnauthRemoteRepositoryImpl: RemoteRepository {
    
    func getDecodable<T: Decodable>(url: String, type: T.Type, headers: HTTPHeaders? = nil) async throws -> T {
        return try await AF.request(url, headers: headers).serializingDecodable(type).value
    }
    
    func post<T: Decodable>(url: String, parameters: [String: Any], type: T.Type, headers: HTTPHeaders? = nil) async throws -> T {
        return try await AF.request(url, method: .post, parameters: parameters, headers: headers).serializingDecodable(type).value
    }
}
