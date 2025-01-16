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
                        
                        // CATEGORIES: Room Essentials, Clothing, Items, Utilities, Services??
                        SubHeading(title: "SHOP BY CATEGORY", showButton: false)
                        LazyVGrid(columns: discoverGridViewModel.single) {
                            ForEach(1...4, id: \.self) { number in
                                Button {
                                    //TODO
                                } label: {
                                    Image("business")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: nil, height: 150)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        
                        // EXPLORE: Display reviews ?
                        SubHeading(title: "EXPLORE", showButton: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: discoverGridViewModel.single) {
                                ForEach(MockBusinesses.businesses) { business in
                                    Boxify(isHorizontal: true)
                                }
                            }
                        }
                        
                        // DISCOUNTS
                        SubHeading(title: "DISCOUNTS & DEALS", showButton: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: discoverGridViewModel.triple) {
                                ForEach(triple(input: discoverGridViewModel.postings)) { posting in
                                    if posting.isDiscounted == true {
                                        Button {
                                            //TODO
                                        }
                                        label: {
                                            ProductCell(posting: posting, width: 150, height: 150)
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(15)
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
