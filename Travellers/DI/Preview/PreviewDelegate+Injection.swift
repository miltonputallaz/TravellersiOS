//
//  PreviewDelegate+Injection.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Resolver

extension Resolver {
    static var mock: Resolver!
    
    static func setupMockMode() {
        Resolver.mock = Resolver(parent: .main)
        Resolver.root = .mock
    }
}

