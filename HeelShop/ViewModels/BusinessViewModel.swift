//
//  BusinessViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/13/25.
//

import Foundation
import SwiftUI

import SwiftUI

final class BusinessViewModel: ObservableObject {
    @Published var businesses: [Business] = []
    
    init(useMock: Bool = true) {
        if useMock {
            loadMockBusinesses()
        } else {
            fetchBusinesses()
        }
    }
    
    private func loadMockBusinesses() {
        self.businesses = MockBusinesses.businesses
    }
    
    func fetchBusinesses() {
        // Placeholder for future API integration
        // networkManager.shared.getBusinesses { result in
        //     DispatchQueue.main.async {
        //         switch result {
        //         case .success(let businesses):
        //             self.businesses = businesses
        //         case .failure(let error):
        //             print("Failed to fetch businesses: \(error)")
        //         }
        //     }
        // }
    }
}
