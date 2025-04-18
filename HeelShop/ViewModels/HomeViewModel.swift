//
//  HomeViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/13/25.
//

import Foundation

final class HomeViewModel: ObservableObject {
    let triple = GridLayouts.triple
    let double = GridLayouts.double
    let single = GridLayouts.single
    
    let useMockData = false // TOGGLE SWITCH FOR MOCK DATA POSTINGS, FOR TESTING PURPOSES ONLY!!!!!

    @Published var postings: [Posting] = []
    
    @Published var discounts: [Posting] = []
    @Published var businesses: [Business] = MockBusinesses.businesses
    @Published var alertItem: alertItem?
    @Published var isLoading = false

    func getPostings() {
        isLoading = true
        
        if useMockData {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.postings = MockData.postings
                self.discounts = MockData.postings.filter { $0.isDiscounted == true }
                self.isLoading = false
            }
        } else {
            NetworkManager.shared.getPostings { result in
                DispatchQueue.main.async {
                    self.isLoading = false
                    switch result {
                    case .success(let postings):
                        self.postings = postings
                        self.discounts = postings.filter { $0.isDiscounted == true }
                    case .failure(let error):
                        self.alertItem = error.alertContext
                    }
                }
            }
        }
    }
}
