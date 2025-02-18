//
//  KeychainManagerImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import Security
import KeychainAccess


actor SessionManager: ObservableObject {
    
    
    @MainActor @Published var isAuthenticated: Bool = false
    private let keychain = Keychain(service: SecurityKeys.JWT_KEYCHAIN_SERVICE)

    init() {
        Task {
            await checkAuthentication()
        }
    }

    /// Asynchronously check if a token exists in Keychain
    func checkAuthentication() async {
        if let token = try? await getToken(), !token.isEmpty {
            await updateAuthenticationState(true)
        } else {
            await updateAuthenticationState(false)
        }
    }

    /// Fetch token from Keychain asynchronously
    func getToken() async throws -> String? {
        return keychain[SecurityKeys.TOKEN_KEY]
    }

    /// Remove token from Keychain and update state
    func logout() async throws{
        try keychain.remove(SecurityKeys.TOKEN_KEY)
        await updateAuthenticationState(false)
    }
    
    /// Helper function to update `isAuthenticated` on the main thread
   @MainActor
   private func updateAuthenticationState(_ state: Bool) {
       self.isAuthenticated = state
   }
}
