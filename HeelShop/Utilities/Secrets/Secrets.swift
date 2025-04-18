//
//  Secrets.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/17/25.
//

import Foundation

enum Secrets {
    static var supabaseURL: String {
        return getPlistValue(forKey: "supabase_url")
    }
    
    static var anonKey: String {
        return getPlistValue(forKey: "anon_key")
    }
    
    private static func getPlistValue(forKey key: String) -> String {
        guard let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
              let dict = NSDictionary (contentsOfFile: path),
              let value = dict[key] as? String else {
            fatalError("❌ Could not load value for key '\(key)' from Keys.plist")
        }
        return value
    }
}
