//
//  AuthView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/17/25.
//

import SwiftUI

struct AuthView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                // Logo
                Text("HeelShop")
                    .font(.system(size: 75, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                
                // Input fields
                InputView(text: $email, title: "Email", placeholder: "name@example.com")
                    .autocapitalization(.none)
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    .autocapitalization(.none)
                
                if let errorMessage = errorMessage {
                    Text("❌ \(errorMessage)").foregroundColor(.red)
                }
                
                // Sign in button
                Button {
                    SupabaseManager.shared.login(email: email, password: password) { result in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let user):
                                print("✅ Logged in: \(user.id)")
                                isLoggedIn = true
                            case .failure(let error):
                                errorMessage = error.localizedDescription
                            }
                        }
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(email.trimmingCharacters(in: .whitespaces).isEmpty ||
                          password.trimmingCharacters(in: .whitespaces).isEmpty)
                .opacity((email.trimmingCharacters(in: .whitespaces).isEmpty ||
                          password.trimmingCharacters(in: .whitespaces).isEmpty) ? 0.5 : 1.0)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                
                // Sign up button
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    .font(.headline)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.tarheel)
            .ignoresSafeArea()
        }
    }
}


#Preview {
    AuthView()
}
