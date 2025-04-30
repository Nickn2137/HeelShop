//
//  FavoriteView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/16/25.
//

import SwiftUI

struct FavoriteView: View {
    let posting: Posting
    var onUnlike: (() -> Void)? = nil

    @StateObject private var viewModel: FavoriteViewModel

    init(posting: Posting, onUnlike: (() -> Void)? = nil) {
        self.posting = posting
        self.onUnlike = onUnlike
        _viewModel = StateObject(wrappedValue: FavoriteViewModel(posting: posting))
    }

    var body: some View {
        Image(systemName: viewModel.isFavorited ? "heart.fill" : "heart")
            .font(.system(size: 25))
            .foregroundColor(viewModel.isFavorited ? .red : .gray)
            .onTapGesture {
                Task {
                    await viewModel.toggleFavorite()
                    if !viewModel.isFavorited {
                        onUnlike?()
                    }
                }
            }
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2)
            .task {
                await viewModel.checkIfFavorited()
            }
    }
}

#Preview {
    FavoriteView(posting: MockData.fakePosting)
}
