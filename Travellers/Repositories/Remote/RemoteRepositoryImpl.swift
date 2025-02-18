//
//  RemoteRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//
import Alamofire

class RemoteRepositoryImpl: RemoteRepository {
    
    private var authInterceptor: AuthRequestInterceptor
    private var logInterceptor: LogRequestsInterceptor
    private var session: Session
    
    init(
        authInterceptor: AuthRequestInterceptor,
        logInterceptor: LogRequestsInterceptor) {
        self.authInterceptor = authInterceptor
        self.logInterceptor = logInterceptor
        session = Session(interceptor: Interceptor(adapters: [authInterceptor, logInterceptor]))
    }
    
    func getDecodable<T: Decodable>(url: String, type: T.Type, headers: HTTPHeaders? = nil) async throws -> T {
        
        return try await session.request(url, headers: headers).serializingDecodable(type).value
    }
    
    func post<T: Decodable>(url: String, parameters: [String: Any], type: T.Type, headers: HTTPHeaders? = nil) async throws -> T {
        return try await session.request(url, method: .post, parameters: parameters, headers: headers).serializingDecodable(type).value
    }
    
    func postFormData(url: String, multipartFormData: MultipartFormData, headers: HTTPHeaders?) async throws -> String {
        return try await session.upload(multipartFormData: multipartFormData, to: url).validate(statusCode: 200..<300).serializingString().value
    }
}
