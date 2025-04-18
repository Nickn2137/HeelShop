//
//  Homeview.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/4/25.
//

import SwiftUI

struct Homeview: View {
    
    var body: some View {
        NavigationStack{
            Search()
            HomeGridView()
        }
    }
}

#Preview {
    Homeview()
}
