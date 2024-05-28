//
//  UsersService.swift
//  Conexa
//
//  Created by Matias Palmieri on 27/05/2024.
//

import Foundation

final class UsersService {
    var urlSession: URLSession?
    var urlTentative: URL?
    
    init(urlSession: URLSession? = URLSession.shared, urlTentative: URL? = nil) {
        self.urlSession = urlSession
        self.urlTentative = urlTentative
    }
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        if urlTentative == nil {
            urlTentative = URL(string: "https://jsonplaceholder.org/users")
        }
        
        guard let url = urlTentative else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        urlSession?.dataTask(with: url) { data, response, error in
            if let _ = error {
                print("Error \(String(describing: error))")
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                do {
                    let newsResponse = try JSONDecoder().decode([User].self, from: data)
                    completion(.success(newsResponse))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
