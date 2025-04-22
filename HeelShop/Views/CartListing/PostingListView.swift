//
//  PostingListView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/21/25.
//

import SwiftUI

struct PostingListView: View {
    let posting: Posting
    var onUnlike: (() -> Void)? = nil
    
    init(posting: Posting, onUnlike: (() -> Void)? = nil) {
        self.posting = posting
        self.onUnlike = onUnlike
    }

    var body: some View {
        HStack{
            postingRemoteImage(urlString: posting.imageUrl)
                .scaledToFill()
                .frame(width: 100, height: 100)

            VStack {
                Text(posting.title)
                    .font(.headline)
                    .lineLimit(1)

                if let price = posting.price {
                    Text("$\(price, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            FavoriteView(posting: posting, onUnlike: onUnlike)
        }
    }
}

#Preview {
    PostingListView(posting: MockData.fakePosting)
}
