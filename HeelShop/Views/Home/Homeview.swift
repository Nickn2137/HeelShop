//
//  Homeview.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/4/25.
//

import SwiftUI

struct Homeview: View {
    @ObservedObject var homeViewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            VStack {
                Search()
                HomeGridView(homeViewModel: homeViewModel)
            }
        }
    }
}

#Preview {
    Homeview(homeViewModel: HomeViewModel())
}
