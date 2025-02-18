//
//  RemoteRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//
import Alamofire

class UnauthRemoteRepositoryImpl: UnauthRemoteRepository {
    
    private var logInterceptor: LogRequestsInterceptor
    private var session: Session
    
    init(
        logInterceptor: LogRequestsInterceptor
    ){
        self.logInterceptor = logInterceptor
        session = Session(interceptor: Interceptor(adapters: [logInterceptor]))
    }
    
    func post<T: Decodable>(url: String, parameters: [String: Any], type: T.Type, headers: HTTPHeaders? = nil) async throws -> T {
        return try await session.request(url, method: .post, parameters: parameters, headers: headers).serializingDecodable(type).value
    }
    
}
