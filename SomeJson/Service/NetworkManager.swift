//
//  DataManager.swift
//  SomeJson
//
//  Created by Anna Melekhina on 16.01.2022.
//

import Foundation

enum Link: String {
    case imageURL = "https://www.meme-arsenal.com/memes/0f3e4d28fc2de15c91a6f83e19f7aa68.jpg"
    case secondButton = "https://jsonplaceholder.typicode.com/posts/2"
    case thirdButton = "https://jsonplaceholder.typicode.com/posts/1"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchText(){
        guard let url = URL(string: Link.secondButton.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            
            do {
                let text = try JSONDecoder().decode(TextBlock.self, from: data)
                
                DispatchQueue.main.async {
//                    
//                    titleLabel.text = text.title
//                    bodyLabel.text = text.body
                }
                
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
//    func fetch<T: Decodable>(dataType: T.Type, from url: String, completion: @escaping(Result<T, NetworkError>) -> Void) {
//        guard let url = URL(string: url) else {
//            completion(.failure(.invalidURL))
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                completion(.failure(.noData))
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                if convertFromSnakeCase {
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                }
//
//                let type = try decoder.decode(T.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(type))
//                }
//            } catch {
//                completion(.failure(.decodingError))
//            }
//        }.resume()
//
//}
}
