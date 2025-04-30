//
//  SupabaseManager.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/17/25.
//

import Foundation
import Supabase

class SupabaseManager {
    static let shared = SupabaseManager()

    let client: SupabaseClient

    private init() {
        client = SupabaseClient(
            supabaseURL: URL(string: Secrets.supabaseURL)!,
            supabaseKey: Secrets.anonKey
        )
    }

    func signUp(email: String, password: String) async throws -> User {
        let session = try await client.auth.signUp(email: email, password: password)
        return session.user
    }

    func login(email: String, password: String) async throws -> User {
        let session = try await client.auth.signIn(email: email, password: password)
        return session.user
    }

    func logout() async throws {
        try await client.auth.signOut()
    }

    func getCurrentUser() -> User? {
        return client.auth.currentUser
    }
}
