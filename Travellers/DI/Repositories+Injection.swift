//
//  Controllers+Injection.swift.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Resolver

extension Resolver {
    public static func registerRepositories() {
        register{ LoginRepositoryImpl(loginRemoteRepository: resolve()) }.implements(LoginRepository.self).scope(.application)
        register(name:.remoteRepositoryName){ RemoteRepositoryImpl(authInterceptor: resolve())  as RemoteRepository}.scope(.application)
        register(name:.unauthRemoteRepositoryName){ UnauthRemoteRepositoryImpl() as RemoteRepository}.scope(.application)
        register{ LoginRemoteRepositoryImpl(remoteRepository: resolve(name: .unauthRemoteRepositoryName), sessionManager: resolve()) }.implements(LoginRemoteRepository.self).scope(.application)
        
    }

}

extension Resolver.Name {
    static let unauthRemoteRepositoryName = Self("unauthRemoteRepository")
    static let remoteRepositoryName = Self("remoteRepository")
}
