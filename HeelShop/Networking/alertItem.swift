//
//  alertItem.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/14/25.
//

import SwiftUI

struct alertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData      = alertItem(title: Text("Server Error"),
                                            message: Text("The data recieved from the server was invalid."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = alertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidURL       = alertItem(title: Text("Server Error"),
                                            message: Text("There was an issue connecting to the server."),
                                            dismissButton: .default(Text("OK")))
    
    static let unableToComplete = alertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your network connection."),
                                            dismissButton: .default(Text("OK")))
}
