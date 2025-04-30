//
//  ProductCell.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/14/25.
//

import SwiftUI

struct ProductCell: View {
    let posting: Posting
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        postingRemoteImage(urlString: posting.imageUrl)
            .scaledToFill()
            .frame(maxWidth: width, maxHeight: height)
            .cornerRadius(10)
            .overlay(alignment: .topTrailing) {
                if posting.isDiscounted ?? false {
                    Capsule()
                        .fill(Color.tarheel)
                        .frame(width: width - 100, height: height / 6)
                        .overlay(
                            Capsule()
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2)
                        .overlay(
                            Image(systemName: "percent")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .bold()
                        )
                        .padding(6)
                }
            }
    }
}

#Preview {
    ProductCell(
        posting: MockData.fakePosting,
        width: 150,
        height: 150
    )
}
