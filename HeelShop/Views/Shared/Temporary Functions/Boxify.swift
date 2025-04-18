//
//  Boxify.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import SwiftUI


struct Boxify: View {
    var isHorizontal: Bool
    
    var body: some View {
        Rectangle()
            .fill(Color("empty"))
            .frame(width: isHorizontal ? 170 : nil, height: isHorizontal ? 130: 150)
            .cornerRadius(5)
    }
}

#Preview {
    Boxify(isHorizontal: true)
}
