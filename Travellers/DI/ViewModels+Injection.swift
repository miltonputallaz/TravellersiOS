//
//  ViewModels+Injection.swift.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Resolver

extension Resolver {
    public static func registerViewModels() {
        register { LoginViewModel(loginRepository: resolve()) }.scope(.unique)
        register { MainViewModel(sessionManager: resolve()) }.scope(.unique)
        register { TravelListViewModel() }.implements((any TravelListViewModelProtocol).self).scope(.unique)
        register { AddEditTravelViewModel(travelsRepository: resolve()) }.implements((any AddEditTravelViewModelProtocol).self).scope(.unique)
    }
}
