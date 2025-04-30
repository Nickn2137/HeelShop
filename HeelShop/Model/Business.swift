//
//  Business.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import Foundation

struct Business: Hashable, Identifiable {
    let id = UUID()
}

enum MockBusinesses {
    static let samepleBusiness = Business()
    
    static let businesses = [
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
        Business(),
    ]
}
