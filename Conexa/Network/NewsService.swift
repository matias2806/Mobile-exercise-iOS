//
//  NewsService.swift
//  Conexa
//
//  Created by Matias Palmieri on 26/05/2024.
//

import Foundation

class NewsService {
    func getNews(completion: @escaping (Result<[New], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.org/posts") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let newsResponse = try JSONDecoder().decode([New].self, from: data)
                completion(.success(newsResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case unknown
}
