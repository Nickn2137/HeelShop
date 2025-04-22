//
//  AccountView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/4/25.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @ObservedObject var viewModel: AccountViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileImageView(urlString: viewModel.profileImageUrl, size: 100)
                
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    // Header
                    VStack(spacing: 0) {
                        ZStack {
                            if let email = SupabaseManager.shared.client.auth.currentUser?.email {
                                Text("\(email)")
                                    .font(.title2)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                        }
                        
                    }
                    .frame(height: 40)
                    .overlay(Divider(), alignment: .bottom)
                    
                    if viewModel.userPostings.isEmpty {
                        Spacer()
                        Text("You haven't posted any listings.")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                            .padding()
                        Spacer()
                    } else {
                        List {
                            ForEach(viewModel.userPostings, id: \.id) { posting in
                                AccountListView(posting: posting) {
                                    Task {
                                        await viewModel.deleteListing(posting.id)
                                    }
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(PlainListStyle())
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            do {
                                try await SupabaseManager.shared.client.auth.signOut()
                                isLoggedIn = false
                            } catch {
                                print("❌ Logout failed: \(error.localizedDescription)")
                            }
                        }
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.red)
                            .accessibilityLabel("Log out")
                    }
                }
            }
            Divider()
        }
        .onChange(of: viewModel.needsRefresh) {
            if viewModel.needsRefresh {
                Task {
                    await viewModel.fetchUserListings()
                    viewModel.needsRefresh = false
                }
            }
        }
        .task {
            await viewModel.fetchUserListings()
            await viewModel.fetchUserMetadata()
        }
    }
}

#Preview {
    AccountView(viewModel: AccountViewModel())
}
