//
//  AppGridViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import SwiftUI

final class AppGridViewModel: ObservableObject {
    
    let triple: [GridItem] = [GridItem(.flexible()),
                              GridItem(.flexible()),
                              GridItem(.flexible())]
    
    let double: [GridItem] = [GridItem(.flexible()),
                              GridItem(.flexible())]
    
    let single: [GridItem] = [GridItem(.flexible())]
    
    @Published var postings: [Posting] = []
    @Published var discounts: [Posting] = []
    @Published var businesses: [Business] = MockBusinesses.businesses // TEMPORARY MOCK BUSINESSES
    @Published var alertItem: alertItem?
    @Published var isLoading = false
    
    func getPostings() {
        isLoading = true
        networkManager.shared.getPostings { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case.success(let postings):
                    self.postings = postings
                    self.discounts = postings.filter { posting in
                        return posting.isDiscounted == true
                    }
                    
                case.failure(let error):
                    switch error {
                        
                    case.invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case.invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case.invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case.unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
