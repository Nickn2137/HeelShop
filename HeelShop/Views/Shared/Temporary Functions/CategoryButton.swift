//
//  CategoryButton.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/17/25.
//

import SwiftUI

struct CategoryButton: View {
    let image: String
    let text: String

    var body: some View {
        Button {
            // TODO:
        } label: {
            ZStack {
                Image(image)
                    .resizable()
                    .overlay(
                        Color.black.opacity(0.35)
                    )
                    .aspectRatio(contentMode: .fill)
                    .frame(width: nil, height: 150)
                    .cornerRadius(8)
                Text(text)
                    .font(.system(size: 50, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .opacity(0.92)
                    .shadow(radius: 5)
            }
        }
    }
}

#Preview {
    CategoryButton(image: "business", text: "Dorm Decor")
}
