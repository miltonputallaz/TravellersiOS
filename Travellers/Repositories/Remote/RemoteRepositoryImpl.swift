//
//  RemoteRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//
import Alamofire

class RemoteRepositoryImpl: RemoteRepository {
    
    private var authInterceptor: AuthRequestInterceptor
    
    init(authInterceptor: AuthRequestInterceptor) {
        self.authInterceptor = authInterceptor
    }
    
    func getDecodable<T: Decodable>(url: String, type: T.Type, headers: HTTPHeaders? = nil) async throws -> T {
        let session = Session(interceptor: authInterceptor)
        return try await session.request(url, headers: headers).serializingDecodable(type).value
    }
    
    func post<T: Decodable>(url: String, parameters: [String: Any], type: T.Type, headers: HTTPHeaders? = nil) async throws -> T {
        let session = Session(interceptor: authInterceptor)
        return try await session.request(url, method: .post, parameters: parameters, headers: headers).serializingDecodable(type).value
    }
}
