//
//  HomeGridView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import SwiftUI

struct HomeGridView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var businessViewModel = BusinessViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // New Brands Section
                        SeeAll(title: "STOREFRONTS", showButton: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: homeViewModel.single) {
                                ForEach(businessViewModel.businesses) { business in
                                    Button {
                                        //TODO: Business detail view
                                    } label: {
                                        Image("business")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 170, height: 130)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        
                        // Trending Products Section
                        SeeAll(title: "TRENDING PRODUCTS", showButton: true)
                        LazyVGrid(columns: homeViewModel.double) {
                            
                            // !!! TEMPORARY "dummyPostings" VARIABLE !!!
                            
                            if homeViewModel.postings.isEmpty {
                                Text("No Postings")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .padding(.top, 40)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            } else {
                                ForEach(homeViewModel.postings) { posting in
                                    NavigationLink(value: posting) {
                                        VStack {
                                            ProductCell(posting: posting, width: 150, height: 150)
                                            HStack {
                                                Text("$\(posting.price ?? 0, specifier: "%.2f")")
                                                    .foregroundColor(.black)
                                                    .bold()
                                                Spacer()
                                                FavoriteView(posting: posting)
                                            }
                                            .padding(.horizontal, 20)
                                        }
                                    }
                                }
                            }
                        }
                        .navigationDestination(for: Posting.self) { posting in DetailView(posting: posting)}
                    }
                    .padding(15)
                }
                .scrollIndicators(.hidden)
                .onAppear() {
                    homeViewModel.getPostings()
                }
                if homeViewModel.isLoading {
                    LoadingView()
                }
            }
        }
        .alert(item: $homeViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    HomeGridView()
}
