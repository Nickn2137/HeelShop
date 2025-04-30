//
//  InputView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/20/25.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String?
    let placeholder: String
    var isSecureField = false
    var trailingIcon: Bool? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let title = title, !title.isEmpty {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.darkheel)
                    .fontDesign(.rounded)
            }
            if isSecureField {
                HStack {
                    SecureField(placeholder, text: $text)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    if let match = trailingIcon {
                        match ? Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                            : Image(systemName: "x.circle.fill").foregroundColor(.red)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            } else {
                HStack {
                    TextField(placeholder, text: $text)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}
