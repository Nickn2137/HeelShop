//
//  AccountViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/22/25.
//

import Foundation
import Supabase

@MainActor
class AccountViewModel: ObservableObject {
    @Published var userPostings: [Posting] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var profileImageUrl: String? = nil
    @Published var needsRefresh: Bool = false
    
    func fetchUserMetadata() async {
        guard let userId = SupabaseManager.shared.client.auth.currentUser?.id.uuidString else { return }
        
        do {
            let response = try await SupabaseManager.shared.client
                .from("users")
                .select("image_url")
                .eq("id", value: userId)
                .single()
                .execute()
            
            struct Result: Decodable {
                let image_url: String?
            }
            
            let decoded = try JSONDecoder().decode(Result.self, from: response.data)
            profileImageUrl = decoded.image_url
        } catch {
            print("Failed to fetch profile image:", error.localizedDescription)
        }
    }
    
    func fetchUserListings() async {
        guard let userId = SupabaseManager.shared.client.auth.currentUser?.id.uuidString else {
            errorMessage = "Not logged in"
            return
        }

        isLoading = true
        defer { isLoading = false }

        do {
            let response = try await SupabaseManager.shared.client
                .from("listings")
                .select("*")
                .eq("user_id", value: userId)
                .execute()

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            userPostings = try decoder.decode([Posting].self, from: response.data)
        } catch {
            errorMessage = "Failed to fetch listings: \(error.localizedDescription)"
        }
    }
    
    func deleteListing(_ id: String) async {
        do {
            try await SupabaseManager.shared.client
                .from("listings")
                .delete()
                .eq("id", value: id)
                .execute()
            
            userPostings.removeAll { $0.id == id }
        } catch {
            errorMessage = "Failed to delete listing: \(error.localizedDescription)"
            print("Delete error:", error.localizedDescription)
        }
    }
}
