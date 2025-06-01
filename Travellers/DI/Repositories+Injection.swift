//
//  Repositories+Injection.swift.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Resolver

extension Resolver {
    public static func registerRepositories() {
        //CORE DATA//
        register { CoreDataStack() }.scope(.application)
        register { let coreData: CoreDataStack = Resolver.resolve(); return coreData.persistentContainer}.scope(.application)
        //

        register{ LoginRepositoryImpl(loginRemoteRepository: resolve(), sessionManager: resolve() ) }.implements(LoginRepository.self).scope(.application)
        register{ RemoteRepositoryImpl(authInterceptor: resolve(), logInterceptor: resolve())}.implements(RemoteRepository.self).scope(.application)
        register{ UnauthRemoteRepositoryImpl(logInterceptor: resolve())}.implements(UnauthRemoteRepository.self).scope(.application)
        register{ LoginRemoteRepositoryImpl(unauthRemoteRepository: resolve()) }.implements(LoginRemoteRepository.self).scope(.application)
        register{ TravelsRemoteRepositoryImpl(remoteRepository: resolve()) }.implements(TravelsRemoteRepository.self).scope(.application)
        register{ TravelsLocalRepositoryImpl(persistenContainer: resolve()) }.implements(TravelsLocalRepository.self).scope(.application)
        register{ TravelsRepositoryImpl(travelsRemoteRepository: resolve(), travelsLocalRepository: resolve()) }.implements(TravelsRepository.self).scope(.application)
    }

}
