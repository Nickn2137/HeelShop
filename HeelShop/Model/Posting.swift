//
//  Posting.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/14/25.
//

import Foundation

struct Posting: Hashable, Decodable, Identifiable {
    let id: String
    let title: String
    let description: String?
    let price: Double?
    let imageUrl: String?
    let userId: String
    var isDiscounted: Bool?
}

enum MockData {
    static let fakePosting = Posting(
        id: "",
        title: "Fake Item",
        description: "This item is not real.",
        price: 4.21,
        imageUrl: "",
        userId: "0e0c2d08-737e-4efb-b45b-3dabf05a16cf",
        isDiscounted: true
    )
    
    static let postings: [Posting] = (0 ..< 4).map { i in
        Posting(
            id: UUID().uuidString,
            title: "Fake Item",
            description: "This item is not real.",
            price: 4.21,
            imageUrl: "",
            userId: "0e0c2d08-737e-4efb-b45b-3dabf05a16cf",
            isDiscounted: true
        )
    }
}
