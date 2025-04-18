//
//  ItemPlaceholderImage.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/17/25.
//

import SwiftUI

struct ItemPlaceholderImage: View {
    var body: some View {
        ZStack {
            Color.lightgray
                .ignoresSafeArea()
            Image(systemName: "duffle.bag.fill")
                .resizable()
                .scaledToFit()
                .padding()
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ItemPlaceholderImage()
}
