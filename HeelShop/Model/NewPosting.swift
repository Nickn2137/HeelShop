//
//  NewPosting.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/17/25.
//

import Foundation

struct NewPosting: Encodable {
    let title: String
    let description: String
    let price: Double
    let image_url: String
    let user_id: String
    let is_discounted: Bool
}
