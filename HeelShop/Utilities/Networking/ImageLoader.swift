//
//  ImageLoader.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/14/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var uiImage: UIImage? = nil

    func load(from urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { image in
            DispatchQueue.main.async {
                self.uiImage = image
            }
        }
    }
}

struct postingRemoteImage: View {
    @StateObject private var loader = ImageLoader()
    let urlString: String?

    var body: some View {
        Group {
            if let uiImage = loader.uiImage {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                Image("imageplaceholder")
                    .resizable()
            }
        }
        .onAppear {
            if let urlString = urlString {
                loader.load(from: urlString)
            }
        }
    }
}
