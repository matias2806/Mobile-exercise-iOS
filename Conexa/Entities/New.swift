//
//  New.swift
//  Conexa
//
//  Created by Matias Palmieri on 26/05/2024.
//

import Foundation

// MARK: - New
struct New: Codable, Identifiable {
    let id: Int
    let slug: String
    let url: String
    let title, content: String
    let image, thumbnail: String
    let status: String
    let category: String
    let publishedAt, updatedAt: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id, slug, url, title, content, image, thumbnail, status, category, publishedAt, updatedAt
        case userID = "userId"
    }
}
