//
//  CartListing.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/21/25.
//

import Foundation

struct CartListing: Decodable, Identifiable {
    let id: UUID
    let listings: Posting
}
