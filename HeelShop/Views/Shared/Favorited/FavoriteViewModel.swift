//
//  FavoriteViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/21/25.
//

import Foundation
import Supabase
import WidgetKit

@MainActor
class FavoriteViewModel: ObservableObject {
    @Published var isFavorited = false
    
    struct FavoriteInsert: Codable {
        let user_id: String
        let post_id: String
    }
    
    let posting: Posting
    
    init(posting: Posting) {
        self.posting = posting
    }
    
    func toggleFavorite() async {
        isFavorited ? await removeFavorite() : await addFavorite()
        isFavorited.toggle()
    }
    
    func checkIfFavorited() async {
        guard let userId = SupabaseManager.shared.client.auth.currentUser?.id else { return }
        
        do {
            let favorites: [Favorite] = try await SupabaseManager.shared.client
                .from("favorites")
                .select()
                .eq("user_id", value: userId.uuidString)
                .eq("post_id", value: posting.id)
                .execute()
                .value
            
            isFavorited = !favorites.isEmpty
        } catch {
            isFavorited = false
        }
    }
    
    private func addFavorite() async {
        guard let userId = SupabaseManager.shared.client.auth.currentUser?.id else { return }
        
        do {
            let favorites: [Favorite] = try await SupabaseManager.shared.client
                .from("favorites")
                .select()
                .eq("user_id", value: userId)
                .eq("post_id", value: posting.id)
                .execute()
                .value
            
            if favorites.isEmpty {
                let newFavorite = FavoriteInsert(user_id: userId.uuidString, post_id: posting.id)
                try await SupabaseManager.shared.client
                    .from("favorites")
                    .insert(newFavorite)
                    .execute()
                updateCartCount()
                WidgetCenter.shared.reloadAllTimelines() // Trigger widget refresh
            }
        } catch {
            print("Failed to add favorite:", error.localizedDescription)
        }
    }
    
    private func removeFavorite() async {
        guard let userId = SupabaseManager.shared.client.auth.currentUser?.id else { return }
        
        do {
            try await SupabaseManager.shared.client
                .from("favorites")
                .delete()
                .eq("user_id", value: userId.uuidString)
                .eq("post_id", value: posting.id)
                .execute()
            updateCartCount()
        } catch {
            print("Failed to remove favorite:", error.localizedDescription)
        }
    }
    
    private func updateCartCount() {
        let currentFavoritesCount = fetchCurrentFavoritesCount()

        if let sharedDefaults = UserDefaults(suiteName: "group.com.nicknguyen.heelshop") {
            sharedDefaults.set(currentFavoritesCount, forKey: "cartItemCount")
        }
    }
    
    private func fetchCurrentFavoritesCount() -> Int {
        return isFavorited ? 1 : 0
    }
}
