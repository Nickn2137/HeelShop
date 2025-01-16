//
//  AppGridView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import SwiftUI

struct HomeGridView: View {
    
    @StateObject var gridViewModel = AppGridViewModel() // Combined ViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // New Brands Section
                        SubHeading(title: "STOREFRONTS", showButton: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: gridViewModel.single) {
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
                        // Trending Products Section
                        SubHeading(title: "TRENDING PRODUCTS", showButton: true)
                        LazyVGrid(columns: gridViewModel.double) {
                            
                            // !!! TEMPORARY triple() FUNCTION !!!
                            
                            ForEach(triple(input: gridViewModel.postings)) { posting in
                                NavigationLink(value: posting) {
                                    VStack{
                                        ProductCell(posting: posting, width: 150, height: 150)
                                            .padding(.top)
                                        PriceView(price: posting.price)
                                    }
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.blue, lineWidth: 2) // Add blue outline
                                    )
                                }
                            }
                        }
                        .navigationDestination(for: Posting.self) { posting in DetailView(posting: posting)}
                    }
                    .padding(15)
                }
                .onAppear() {
                    gridViewModel.getPostings()
                }
                if gridViewModel.isLoading {
                    LoadingView()
                }
            }
        }
        .alert(item: $gridViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    HomeGridView()
}
