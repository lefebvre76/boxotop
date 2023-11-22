//
//  ListMovies.swift
//  Boxotop
//
//  Created by loic lefebvre on 22/11/2023.
//

import Foundation

struct ListMovies: Decodable {
    var search: [Movie]
    var totalResults: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
    }
}
