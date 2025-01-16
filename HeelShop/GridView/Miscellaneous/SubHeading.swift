//
//  SubHeading.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import SwiftUICore
import SwiftUI


struct SubHeading: View {
    var title: String
    let showButton: Bool
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 25))
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            if showButton {
                Button(action: {
                    // Action for See All
                }) {
                    Text("See All")
                        .foregroundColor(.blue) // Example styling
                }
            } else {
                
            }
        }
        .padding(.vertical, 10)
    }
}
