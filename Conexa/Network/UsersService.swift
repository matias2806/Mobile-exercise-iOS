//
//  UsersService.swift
//  Conexa
//
//  Created by Matias Palmieri on 27/05/2024.
//

import Foundation

class UsersService {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.org/users") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let newsResponse = try JSONDecoder().decode([User].self, from: data)
                completion(.success(newsResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
