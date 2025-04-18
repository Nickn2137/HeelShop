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
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button("Sign Up") {
                SupabaseManager.shared.signUp(email: email, password: password) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let user):
                            print("✅ Signed up: \(user.id)")
                            isLoggedIn = true
                        case .failure(let error):
                            errorMessage = error.localizedDescription
                        }
                    }
                }
            }

            Button("Log In") {
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
            }
            
            if let errorMessage = errorMessage {
                Text("❌ \(errorMessage)").foregroundColor(.red)
            }
        }
        .padding()
    }
}


#Preview {
    AuthView()
}
