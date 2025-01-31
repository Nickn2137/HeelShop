//
//  networkManager.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/14/25.
//

import Foundation
import UIKit

final class networkManager {
    
    static let shared = networkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://fakestoreapi.com/"
    private let productURL = baseURL + "products"
    
    // Singleton Method Implementation
    private init() {}
    
    func getPostings(completed: @escaping (Result<[Posting], PError>) -> Void) { // @escaping means closure will outlive what it is passed to; stored and executed later
        guard let url = URL(string: productURL) else { // Attempts to fetch URL
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in // URLSession.shared.dataTask = network call
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { // Checks if response == 200, which means successful
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([Posting].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string:urlString) // Converts urlString to NSString to be used as a key
        
        if let image = cache.object(forKey: cacheKey) { // Checks if image is cached; return immediately if it exists.
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else { // Converts urlString to URL object, returns early if fails.
            completed(nil) // Means image failed to load
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in // Network call; sends HTTP request to fetch data asynchronously
            guard let data = data, let image = UIImage(data:data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
