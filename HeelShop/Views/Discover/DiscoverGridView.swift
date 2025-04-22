//
//  DiscoverGridViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import SwiftUI

struct DiscoverGridView: View {
    
    @StateObject var discoverViewModel = DiscoverViewModel()
    @StateObject var businessViewModel = BusinessViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Trending Shops Section
                        SeeAll(title: "TRENDING SHOPS", showButton: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: discoverViewModel.single) {
                                ForEach(businessViewModel.businesses) { business in
                                    Button {
                                        //TODO
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
                        
                        // CATEGORIES: Room Essentials, Clothing, Items, Utilities ?
                        // TODO, use a database, another API, or filter one out?
                        SeeAll(title: "SHOP BY CATEGORY", showButton: false)
                        LazyVGrid(columns: discoverViewModel.single, spacing: 10) {
                            CategoryButton(image: "clothes", text: "Clothes")
                            CategoryButton(image: "room", text: "Dorm Decor")
                            CategoryButton(image: "bike", text: "Utilities")
                            CategoryButton(image: "house", text: "Others")
                        }
                        
                        // EXPLORE: Display reviews ?
                        // TODO, use a database, another API, or filter one out?
                        SeeAll(title: "EXPLORE", showButton: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: discoverViewModel.single) {
                                ForEach(businessViewModel.businesses) { _ in
                                    ReviewView()
                                }
                            }
                        }
                        
                        // DISCOUNTS
                        //TODO "discoverGridViewModel.dummyPostings.filter { $0.isDiscounted == true }" SHOULD NOT BE IN FINAL
                        SeeAll(title: "DISCOUNTS & DEALS", showButton: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: discoverViewModel.discountRows) {
                                ForEach(discoverViewModel.discountedPostings) {posting in
                                    NavigationLink(value: posting) {
                                        ProductCell(posting: posting, width: 150, height: 150)
                                    }
                                }
                            }
                            .navigationDestination(for: Posting.self) { posting in DetailView(posting: posting)}
                        }
                    }
                }
                .padding(15)
                .scrollIndicators(.hidden)
            }
            .onAppear() {
                discoverViewModel.getPostings()
            }
            if discoverViewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $discoverViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}


#Preview {
    DiscoverGridView()
}
