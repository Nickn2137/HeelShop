////
////  SearchView.swift
////  HeelShop
////
////  Created by Nicholas Nguyen on 1/17/25.
////
//
//// WORK IN PROCESS...
//
//import SwiftUI
//
//struct SearchView: View {
//    
//    @StateObject var searchViewModel = HomeViewModel()
//    @State private var isPopUpVisible = false
//    @State private var searchText = ""
//    
//    var filteredPostings: [Posting] {
//        guard !searchText.isEmpty else { return searchViewModel.postings }
//        return searchViewModel.postings.filter {$0.title.localizedCaseInsensitiveContains(searchText)}
//    }
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                
//                if searchViewModel.isLoading {
//                    LoadingView()
//                } else {
//                    LazyVGrid(columns: searchViewModel.double) {
//                        
//                        // !!! TEMPORARY "dummyPostings" VARIABLE !!!
//                        
//                        ForEach(filteredPostings) { posting in
//                            NavigationLink(value: posting) {
//                                VStack{
//                                    ProductCell(posting: posting, width: 150, height: 150)
//                                        .padding(.top)
//                                    PriceView(price: posting.price)
//                                }
//                            }
//                        }
//                    }
//                    .navigationDestination(for: Posting.self) { posting in DetailView(
//                         posting: posting
//                    )}
//                }
//            }
//            .searchable(text: $searchText, prompt: "I'm looking for...")
//            .onAppear() {
//                searchViewModel.getPostings()
//            }
//        }
//    }
//}
//
//#Preview {
//    SearchView()
//}
