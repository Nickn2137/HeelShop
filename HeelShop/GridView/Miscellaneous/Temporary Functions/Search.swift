//
//  File.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/5/25.
//

import SwiftUI


struct Search: View {
    var body: some View {
            HStack{
                Rectangle()
                    .fill(Color("empty"))
                    .frame(width: 300, height: 35)
                    .cornerRadius(10)
                Spacer()
                
                Image(systemName: "bag")
                    .resizable()
                    .frame(width: 35, height: 35)
                
            }
            .padding(15)
    }
}

#Preview {
    Search()
}
