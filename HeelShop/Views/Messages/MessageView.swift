//
//  MessageView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/4/25.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        NavigationStack{
            
            //HEADER
            VStack(spacing: 0) {
                ZStack {
                    Text("Inbox")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center) // Center the text
                    
                    HStack {
                        Spacer() // Push the image to the far right
                        
                        Image(systemName: "bell")
                            .resizable()
                            .frame(width: 25, height: 25)

                    }
                    .padding()
                }
                .frame(height: 40)
                .overlay(Divider(), alignment: .bottom)
                
                //MESSAGE LIST
                
                List {
                    ForEach(0...10, id: \.self) { message in
                        InboxRowView()
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}

#Preview {
    MessageView()
}
