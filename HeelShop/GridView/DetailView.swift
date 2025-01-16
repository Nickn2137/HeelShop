//
//  DetailView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/16/25.
//

import SwiftUI

struct DetailView: View {
    
    let posting: Posting
    
    var body: some View {
        VStack {
            postingRemoteImage(urlString: posting.image)
                .frame(width: 300, height: 300)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                .padding()
            HStack{
                Text(posting.title)
                Image(systemName: "heart")
            }
            .padding()
            Text(posting.description)
                .padding()
        }
    }
}

#Preview {
    DetailView(posting: MockData.samplePosting)
}
