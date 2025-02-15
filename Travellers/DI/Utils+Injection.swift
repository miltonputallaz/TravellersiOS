//
//  Utils+Injection.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Resolver

extension Resolver {

    public static func registerUtils() {
        register{ SessionManager() }.scope(.application)
    }
}
