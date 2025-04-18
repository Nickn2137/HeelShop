//
//  DiscoverViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/13/25.
//

import Foundation
import SwiftUI

final class DiscoverViewModel: ObservableObject {
    let triple = GridLayouts.triple
    let double = GridLayouts.double
    let single = GridLayouts.single

    @Published var postings: [Posting] = [] {
        didSet {
            self.dummyPostings = tripleArray(input: postings)
        }
    }
    
    @Published var dummyPostings: [Posting] = []
    @Published var alertItem: alertItem?
    @Published var isLoading = false
    
    var discountedPostings: [Posting] {
        dummyPostings.filter { $0.isDiscounted == true }
    }
    
    func getPostings() {
        isLoading = true
        NetworkManager.shared.getPostings { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let postings):
                    self.postings = postings
                case .failure(let error):
                    self.alertItem = error.alertContext
                }
            }
        }
    }
}
