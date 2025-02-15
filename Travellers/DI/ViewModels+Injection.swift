//
//  Controllers+Injection.swift.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Resolver

extension Resolver {
    public static func registerViewModels() {
        register { LoginViewModel(loginRepository: resolve()) }.scope(.unique)
        register { MainViewModel(sessionManager: resolve()) }.scope(.unique)
        register { TravelListViewModel() }.scope(.unique)
        register { AddTravelViewModel() }.scope(.unique)
    }
}
