//
//  DetailView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/16/25.
//

import SwiftUI

struct DetailView: View {
    let posting: Posting

    var body: some View {
        ScrollView {
            VStack {
                postingRemoteImage(urlString: posting.imageUrl)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .cornerRadius(10)
                    .padding()
                Divider()
                    .padding(.horizontal)
                Text(posting.title)
                    .padding()

                Divider()
                    .padding(.horizontal)
                Text(posting.description ?? "No description available.")
                    .padding()
            }
        }
        .padding(.top)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "bag")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
        }
    }
}

#Preview {
    DetailView(
        posting: MockData.fakePosting
    )
}
