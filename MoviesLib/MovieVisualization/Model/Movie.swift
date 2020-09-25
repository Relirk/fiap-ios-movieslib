//
//  Movie.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 24/09/20.
//  Copyright © 2020 FIAP. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let title: String?
    let categories: String?
    let duration: String?
    let rating: Double?
    let summary: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "titulo"
        case categories, duration, rating, summary, image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? "Título desconhecido"
        categories = try container.decodeIfPresent(String.self, forKey: .categories)
        duration = try container.decodeIfPresent(String.self, forKey: .duration)
        rating = try container.decodeIfPresent(Double.self, forKey: .rating) ?? Double(container.decodeIfPresent(String.self, forKey: .rating) ?? "0")
        summary = try container.decodeIfPresent(String.self, forKey: .summary)
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? "placeholder"
    }
    
}
