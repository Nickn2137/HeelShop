//
//  Discoverview.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/4/25.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationStack {
            Search()
            DiscoverGridView()
        }
    }
}

#Preview {
    DiscoverView()
}
