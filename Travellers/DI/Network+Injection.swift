//
//  Network+Injection.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//
import Resolver
import Alamofire

extension Resolver {
    public static func registerNetwork() {
        register { AuthRequestInterceptor(sessionManager: Resolver.resolve()) }.implements(RequestInterceptor.self)
        register { LogRequestsInterceptor(sessionManager: Resolver.resolve()) }.implements(RequestInterceptor.self)
    }
}
