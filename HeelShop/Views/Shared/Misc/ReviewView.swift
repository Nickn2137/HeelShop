//
//  ReviewView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/17/25.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        ZStack {
            Image("plant")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 130)
                .clipped()
        }
        .frame(width: 170, height: 130)
        .cornerRadius(10)
    }
}

#Preview {
    ReviewView()
}
