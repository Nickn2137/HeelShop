//
//  GridLayouts.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/13/25.
//

import Foundation
import SwiftUI

enum GridLayouts {
    static let single = [GridItem(.flexible())]
    static let double = [GridItem(.flexible()), GridItem(.flexible())]
    static let triple = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
}
