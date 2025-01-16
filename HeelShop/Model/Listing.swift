//
//  Listing.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import Foundation

struct Listing: Hashable, Identifiable {
    let id = UUID()
}

struct MockListings {
    
    static let samepleListing = Listing()
    
    static let listings = [
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing(),
        Listing()
    ]
}
