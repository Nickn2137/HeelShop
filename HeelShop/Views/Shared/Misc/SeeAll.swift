//
//  SubHeading.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import SwiftUI
import SwiftUICore

struct SeeAll: View {
    var title: String
    let showButton: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 25))
                .fontDesign(.rounded)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            if showButton {
                Button(action: {
                    // Action for See All
                }) {
                    Text("See All")
                        .fontDesign(.rounded)
                        .foregroundColor(.blue) // Example styling
                }
            } else {}
        }
        Divider()
    }
}

#Preview {
    SeeAll(title: "TRENDING PRODUCTS", showButton: true)
}
