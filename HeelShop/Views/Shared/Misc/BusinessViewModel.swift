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
        businesses = MockBusinesses.businesses
    }
    
    func fetchBusinesses() {
        // Placeholder for future API integration
    }
}
