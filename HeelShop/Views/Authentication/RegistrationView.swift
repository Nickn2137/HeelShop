//
//  RegistrationView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/20/25.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    @StateObject private var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss

    private var passwordsMatch: Bool? {
        if confirmpassword.isEmpty { return nil }
        return password == confirmpassword
    }

    private var isFormValid: Bool {
        !email.trimmingCharacters(in: .whitespaces).isEmpty &&
            !username.trimmingCharacters(in: .whitespaces).isEmpty &&
            !password.trimmingCharacters(in: .whitespaces).isEmpty &&
            password == confirmpassword
    }

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Logo
            Text("HeelShop")
                .font(.system(size: 75, weight: .bold, design: .rounded))
                .foregroundStyle(.white)

            // Input fields
            InputView(text: $email, title: "Email", placeholder: "name@example.com")
                .autocapitalization(.none)
            InputView(text: $username, title: "Username", placeholder: "Enter your username")
                .autocapitalization(.none)
            InputView(
                text: $password,
                title: "Password",
                placeholder: "Enter your password",
                isSecureField: true
            )
            .autocapitalization(.none)
            InputView(
                text: $confirmpassword,
                title: "Confirm Password",
                placeholder: "Confirm your password",
                isSecureField: true,
                trailingIcon: passwordsMatch
            )
            .autocapitalization(.none)

            // Sign up button
            Button {
                Task {
                    await viewModel.signUp(email: email, username: username, password: password)
                }
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .opacity(isFormValid ? 1.0 : 0.5)
            .disabled(!isFormValid)
            .cornerRadius(10)
            .padding(.top, 24)

            if let error = viewModel.errorMessage {
                Text("\(error)")
                    .foregroundColor(.red)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }

            Spacer()

            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
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

#Preview {
    RegistrationView()
}
