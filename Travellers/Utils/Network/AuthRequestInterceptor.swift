//
//  RequestInterceptor.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//
import Alamofire

struct AuthRequestInterceptor: RequestInterceptor {
    
    private var sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        Task {
            let token = try await sessionManager.getToken()
            var urlRequest = urlRequest
            urlRequest.headers.add(.authorization(bearerToken: token!))

            completion(.success(urlRequest))
        }
        
    }
}
