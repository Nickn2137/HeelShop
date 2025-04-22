//
//  RegistrationViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/20/25.
//

import Foundation
import Supabase

@MainActor
class RegistrationViewModel: ObservableObject {
    @Published var errorMessage: String?

    func signUp(email: String, username: String, password: String) async {
        do {
            let response = try await SupabaseManager.shared.client.auth.signUp(email: email, password: password)

            let user = response.user

            let newUser = NewUser(
                id: user.id.uuidString,
                email: email,
                username: username,
                image_url: ""
            )

            _ = try await SupabaseManager.shared.client
                .from("users")
                .insert(newUser)
                .execute()

            UserDefaults.standard.set(true, forKey: "isLoggedIn")

        } catch {
            self.errorMessage = error.localizedDescription
            print("❌ Sign-up failed:", error.localizedDescription)
        }
    }
}

