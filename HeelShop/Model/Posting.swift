//
//  Posting.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/14/25.
//

import Foundation

struct Posting: Hashable, Decodable, Identifiable { // Decodable becaue we're GETTING data
    let id: Int
    let title: String
    let description: String
    let image: String
    let category: String
    let price: Double
    var isDiscounted: Bool?
}

struct PostingResponse: Decodable {
    let request: [Posting]
}

struct MockData {
    static let samplePosting = Posting(id: 1,
                                       title: "Mock Title",
                                       description: "Mock Description",
                                       image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                       category: "Mock Category",
                                       price: 99.99,
                                       isDiscounted: true)
    
    static let postings = [Posting(id: 1,
                                   title: "Mock Title",
                                   description: "Mock Description",
                                   image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                   category: "Mock Category",
                                   price: 99.99
                                   ),
                           
                           Posting(id: 2,
                                   title: "Mock Title",
                                   description: "Mock Description",
                                   image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                   category: "Mock Category",
                                   price: 99.99
                                  ),
                           
                           Posting(id: 3,
                                   title: "Mock Title",
                                   description: "Mock Description",
                                   image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                   category: "Mock Category",
                                   price: 99.99
                                   ),
                                                                                   
                           Posting(id: 4,
                                   title: "Mock Title",
                                   description: "Mock Description",
                                   image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                                   category: "Mock Category",
                                   price: 99.99
                                  )]
    
    
}

