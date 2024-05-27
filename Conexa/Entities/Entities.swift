//
//  Entities.swift
//  Conexa
//
//  Created by Matias Palmieri on 26/05/2024.
//

import Foundation

// MARK: - New

//struct NewResponse: Codable {
//    let site_id: String
//    let paging: PagingInfo
//    let results: [New]
//}

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

//enum Category: String, Codable {
//    case elementum = "elementum"
//    case ipsum = "ipsum"
//    case jsonplaceholder = "jsonplaceholder"
//    case lorem = "lorem"
//    case rutrum = "rutrum"
//}

//enum Status: String, Codable {
//    case published = "published"
//}

//typealias Welcome = [New]
