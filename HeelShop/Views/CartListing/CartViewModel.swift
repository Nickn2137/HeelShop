//
//  CartViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/21/25.
//

import Foundation
import Supabase
import WidgetKit

@MainActor
class CartViewModel: ObservableObject {
    @Published var cart: [Posting] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchFavorites() async {
        guard let userId = SupabaseManager.shared.client.auth.currentUser?.id.uuidString.lowercased() else {
            errorMessage = "Not logged in"
            return
        }

        isLoading = true
        defer { isLoading = false }

        do {
            let response = try await SupabaseManager.shared.client
                .from("favorites")
                .select("id, listings(*)")
                .eq("user_id", value: userId)
                .execute()

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let data = try decoder.decode([CartListing].self, from: response.data)

            cart = data.map { $0.listings }

            if let sharedDefaults = UserDefaults(suiteName: "group.com.nicknguyen.heelshop") {
                sharedDefaults.set(cart.count, forKey: "cartItemCount")
            }

            WidgetCenter.shared.reloadAllTimelines()
        } catch {
            errorMessage = error.localizedDescription
            print("Failed to fetch favorites:", error.localizedDescription)
        }
    }
}
