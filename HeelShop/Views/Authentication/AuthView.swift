//
//  AuthView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/17/25.
//

import SwiftUI

struct AuthView: View {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("heelshoplogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)

                Text("HeelShop")
                    .font(.system(size: 75, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)

                InputView(text: $authViewModel.email, title: "Email", placeholder: "name@example.com")
                    .autocapitalization(.none)

                InputView(text: $authViewModel.password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                    .autocapitalization(.none)

                if let errorMessage = authViewModel.errorMessage {
                    Text("\(errorMessage)")
                        .foregroundColor(.red)
                }

                // Sign in button
                Button {
                    Task {
                        await authViewModel.login()
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
                .disabled(authViewModel.email.isEmpty || authViewModel.password.isEmpty)
                .opacity((authViewModel.email.isEmpty || authViewModel.password.isEmpty) ? 0.5 : 1.0)
                .cornerRadius(10)
                .padding(.top, 24)

                // Sign up navigation
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

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.tarheel)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    AuthView()
}
