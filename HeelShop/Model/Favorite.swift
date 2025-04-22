//
//  Favorite.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/21/25.
//

import Foundation

struct Favorite: Decodable {
    let id: UUID
    let user_id: String
    let post_id: String
    let created_at: String?
}
