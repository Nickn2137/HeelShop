//
//  ContentView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/17/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            ShopTabView()
        } else {
            AuthView()
        }
    }
}

#Preview {
    ContentView()
}
