//
//  AccountListView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/22/25.
//

import SwiftUI

struct AccountListView: View {
    let posting: Posting
    var onDelete: (() -> Void)? = nil
    
    init(posting: Posting, onDelete: (() -> Void)? = nil) {
        self.posting = posting
        self.onDelete = onDelete
    }

    var body: some View {
        HStack {
            postingRemoteImage(urlString: posting.imageUrl)
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(10)

            VStack(alignment: .leading) {
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

            Button(role: .destructive) {
                onDelete?()
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    AccountListView(posting: MockData.fakePosting)
}
