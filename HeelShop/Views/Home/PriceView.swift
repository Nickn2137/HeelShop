//
//  PriceView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/16/25.
//

import SwiftUI

struct PriceView: View {
    
    @State private var isClicked = false
    let price: Double?
    
    var body: some View {
        HStack {
            Text("$\(price ?? 0, specifier: "%.2f")")
                .foregroundColor(.black)
                .bold()
            Spacer()
            Image(systemName: isClicked ? "heart.fill" : "heart")
                .font(.system(size: 25))
                .foregroundColor(isClicked ? .red : .gray)
                .onTapGesture {
                    isClicked.toggle()
                }
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: 2)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    PriceView(price: 49.99)
}
