//
//  imageLoader.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/14/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(FromURLString urlString: String) {
        networkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?
            .resizable()
            .scaledToFit()
        ??  Image("error")
            .resizable()
            .scaledToFit()
    }
}

struct postingRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {imageLoader.load(FromURLString: urlString)}
    }
    
}
