//
//  Movie.swift
//  Boxotop
//
//  Created by loic lefebvre on 22/11/2023.
//

import Foundation

struct Movie: Decodable {
    let id: String
    let title: String
    let year: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }
}
