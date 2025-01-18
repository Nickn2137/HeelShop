//
//  Triple.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/15/25.
//


//MOCK TRIPLE FUNC
func tripleArray(input: [Posting]) -> [Posting] {
    return Array(repeating: input, count: 3)
        .flatMap { $0 }
        .enumerated()
        .map { index, posting in
            var modifiedPosting = posting
            modifiedPosting.isDiscounted = posting.price < 180
            return modifiedPosting
        }
}
