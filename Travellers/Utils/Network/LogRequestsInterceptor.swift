//
//  LogRequestsInterceptor.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//

import Alamofire

final class LogRequestsInterceptor: RequestInterceptor {
    
    private let sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        print("-----> \(String(describing: urlRequest.url)) ----> Headers: \(urlRequest.headers)")
        completion(.success(urlRequest))
    }
}
