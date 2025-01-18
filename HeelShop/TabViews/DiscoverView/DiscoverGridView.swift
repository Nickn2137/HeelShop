//
//  DiscoverGridViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import SwiftUI

struct DiscoverGridView: View {
    @StateObject var discoverGridViewModel = AppGridViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Trending Shops Section
                        SubHeading(title: "TRENDING SHOPS", showButton: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: discoverGridViewModel.single) {
                                ForEach(MockBusinesses.businesses) { business in
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
                        SubHeading(title: "SHOP BY CATEGORY", showButton: false)
                        LazyVGrid(columns: discoverGridViewModel.single, spacing: 10) {
                            CategoryButton(image: "clothes", text: "Clothes")
                            CategoryButton(image: "room", text: "Dorm Decor")
                            CategoryButton(image: "bike", text: "Utilities")
                            CategoryButton(image: "house", text: "Others")
                        }
                        
                        // EXPLORE: Display reviews ?
                        // TODO, use a database, another API, or filter one out?
                        SubHeading(title: "EXPLORE", showButton: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: discoverGridViewModel.single) {
                                ForEach(MockBusinesses.businesses) { business in
                                    ReviewView()
                                }
                            }
                        }
                        
                        // DISCOUNTS
                        //TODO "triple(input: discoverGridViewModel.postings).filter { $0.isDiscounted == true }" SHOULD NOT BE IN FINAL
                        SubHeading(title: "DISCOUNTS & DEALS", showButton: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: discoverGridViewModel.triple) {
                                ForEach(triple(input: discoverGridViewModel.postings).filter { $0.isDiscounted == true }) {posting in
                                    NavigationLink(value: posting) {
                                        VStack{
                                            ProductCell(posting: posting, width: 150, height: 150)
                                        }
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
                discoverGridViewModel.getPostings()
            }
            if discoverGridViewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $discoverGridViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}


#Preview {
    DiscoverGridView()
}
