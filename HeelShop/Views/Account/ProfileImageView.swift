//
//  ProfileImageView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/22/25.
//

import SwiftUI

struct ProfileImageView: View {
    let urlString: String?
    let size: CGFloat

    var body: some View {
        Group {
            if let urlString = urlString, let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        imageStyle(image)
                    default:
                        fallbackImage
                    }
                }
            } else {
                fallbackImage
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .padding(.top)
    }

    private func imageStyle(_ image: Image) -> some View {
        image
            .resizable()
            .scaledToFill()
    }

    private var fallbackImage: some View {
        Image("accountph")
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    ProfileImageView(urlString: nil, size: 100)
}
