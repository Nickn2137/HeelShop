//
//  CartListingView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/21/25.
//

import SwiftUI

struct CartListingView: View {
    @StateObject private var viewModel = CartViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    //HEADER
                    VStack(spacing: 0) {
                        ZStack {
                            Text("Favorites")
                                .font(.title2)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .frame(height: 40)
                        .overlay(Divider(), alignment: .bottom)
                        
                        //MESSAGE LIST
                        if viewModel.cart.isEmpty {
                            Spacer()
                            Text("Your cart is empty")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                                .padding()
                            Spacer()
                        } else {
                            List {
                                ForEach(viewModel.cart) { posting in
                                    PostingListView(posting: posting) {
                                        viewModel.cart.removeAll { $0.id == posting.id }
                                    }
                                    .listRowSeparator(.hidden)
                                }
                            }
                            .listStyle(PlainListStyle())
                        }
                    }
                }
            }
            .task {
                await viewModel.fetchFavorites()
            }
        }
    }
}

#Preview {
    CartListingView()
}
