//
//  Triple.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/15/25.
//


//MOCK TRIPLE FUNC
func triple(input: [Posting]) -> [Posting] {
    // Repeat the array, flatten it, and modify to include isDiscounted
    return Array(repeating: input, count: 3)
        .flatMap { $0 } // Flatten the nested array into a single array
        .enumerated()
        .map { index, posting in
            var modifiedPosting = posting
            modifiedPosting.isDiscounted = posting.price < 180 // Alternate discounting
            return modifiedPosting
        }
}
