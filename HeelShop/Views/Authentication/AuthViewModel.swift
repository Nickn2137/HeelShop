//
//  AuthViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/26/25.
//

import Foundation
import Supabase
import SwiftUI

@MainActor
class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    func login() async {
        do {
            let user = try await SupabaseManager.shared.login(email: email, password: password)
            isLoggedIn = true
            print("Logged in: \(user.id)")
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func logout() async {
        do {
            try await SupabaseManager.shared.logout()
            isLoggedIn = false
            print("Logged out successfully")
        } catch {
            errorMessage = error.localizedDescription
            print("Logout failed: \(error.localizedDescription)")
        }
    }
}
