//
//  KeychainManagerImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Security
import KeychainAccess


class SessionManager: ObservableObject {
    
    @MainActor
    @Published var isAuthenticated: Bool = false
    private let keychain = Keychain(service: "com.sani.corporation.travellers")

    init() {
        Task {
            await checkAuthentication()
        }
    }

    /// Asynchronously check if a token exists in Keychain
    @MainActor
    func checkAuthentication() async {
        if let token = try? await getToken(), !token.isEmpty {
            isAuthenticated = true
        } else {
            isAuthenticated = false
        }
    }

    /// Fetch token from Keychain asynchronously
    func getToken() async throws -> String? {
        return keychain["auth_token"]
    }

    /// Remove token from Keychain and update state
    @MainActor
    func logout() async {
        try? keychain.remove("auth_token")
        isAuthenticated = false
    }
}
