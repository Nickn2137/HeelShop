//
//  ContentView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/4/25.
//

import SwiftUI

struct ShopTabView: View {
    var body: some View {
        TabView {
            Homeview()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                .toolbarBackground(.white, for: .tabBar)
            DiscoverView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Discover")
                }
                .toolbarBackground(.white, for: .tabBar)
            MessageView()
                .tabItem{
                    Image(systemName: "message")
                    Text("Messages")
                }
                .toolbarBackground(.white, for: .tabBar)
            AccountView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
                .toolbarBackground(.white, for: .tabBar)
        }
    }
}

#Preview {
    ShopTabView()
}
