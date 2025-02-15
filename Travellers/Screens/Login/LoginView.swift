//
//  LoginView.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//
import SwiftUI
import Resolver

struct LoginView: View {
    
    @StateObject private var viewModel: LoginViewModel = Resolver.resolve()
    @EnvironmentObject private var themeManager: ThemeManager
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                TextField(
                    String(localized: "Username"),
                    text: $viewModel.uiState.username
                ).keyboardType(.emailAddress)
                
                TextField(
                    String(localized: "Password"),
                    text: $viewModel.uiState.password
                ).keyboardType(.default)

                Button {
                    Task {
                        await viewModel.login()
                    }
                } label: {
                    Text(String(localized: "Login"))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .padding()
            
            if (viewModel.uiState.loading) {
                ProgressView {
                    Text(String(localized: "Loggin in..."))
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.black.opacity(0.3))
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        
    }
    

}

#Preview {
    Resolver.setupMockMode()
    Resolver.mock.register { LoginRemoteRepositoryImpl(remoteRepository: Resolver.resolve(), sessionManager: Resolver.resolve()) }.implements(LoginRemoteRepository.self)
    Resolver.mock.register { LoginRepositoryImpl(loginRemoteRepository: Resolver.resolve()) }.implements(LoginRepository.self)
    Resolver.mock.register { LoginViewModel(loginRepository: Resolver.resolve()) }
    let loginController: LoginViewModel = Resolver.resolve()
    return LoginView().environmentObject(ThemeManager())
}
