//
//  AppDelegate+Injection.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Resolver

@MainActor
extension Resolver: @retroactive ResolverRegistering {
    nonisolated public static func registerAllServices() {
        registerViewModels()
        registerRepositories()
        registerUtils()
        registerNetwork()
    }
}
