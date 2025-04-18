//
//  PError.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/14/25.
//

import Foundation

enum PError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

extension PError {
    var alertContext: alertItem {
        switch self {
        case .invalidURL:
            return AlertContext.invalidURL
        case .invalidResponse:
            return AlertContext.invalidResponse
        case .invalidData:
            return AlertContext.invalidData
        case .unableToComplete:
            return AlertContext.unableToComplete
        }
    }
}
