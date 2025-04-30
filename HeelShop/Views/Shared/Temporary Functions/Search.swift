//
//  Search.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import SwiftUI

struct Search: View {
    @State private var showCart = false

    var body: some View {
        HStack {
            Rectangle()
                .fill(Color("empty"))
                .frame(width: 300, height: 35)
                .cornerRadius(10)
            Spacer()

            Button {
                showCart = true
            } label: {
                Image(systemName: "bag")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.primary)
            }
        }
        .padding(.horizontal, 15)
        .sheet(isPresented: $showCart) {
            CartListingView()
        }
    }
}

#Preview {
    Search()
}
