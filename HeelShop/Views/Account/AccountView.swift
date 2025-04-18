//
//  AccountView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/4/25.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    var body: some View {
        VStack {
            Button("Log Out") {
                Task {
                    do {
                        try await SupabaseManager.shared.client.auth.signOut()
                        isLoggedIn = false
                    } catch {
                        print("❌ Logout failed: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

#Preview {
    AccountView()
}
