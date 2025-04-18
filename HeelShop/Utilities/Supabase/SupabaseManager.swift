//
//  SupabaseManager.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/17/25.
//

import Supabase
import Foundation

class SupabaseManager {
    static let shared = SupabaseManager()
    
    let client: SupabaseClient
    
    private init() {
        client = SupabaseClient(
            supabaseURL: URL(string: Secrets.supabaseURL)!,
            supabaseKey: Secrets.anonKey
        )
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Task {
            do {
                let session = try await client.auth.signUp(email: email, password: password)
                completion(.success(session.user))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Task {
            do {
                let session = try await client.auth.signIn(email: email, password: password)
                completion(.success(session.user))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func getCurrentUser() -> User? {
        return client.auth.currentUser
    }
}
