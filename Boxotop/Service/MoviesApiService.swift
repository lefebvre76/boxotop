//
//  MoviesApiService.swift
//  Boxotop
//
//  Created by loic lefebvre on 22/11/2023.
//

import Foundation
import Alamofire

class MoviesApiService {
    static func index(query: String, page: Int = 1, type: String = "movie") async -> Result<ListMovies, AFError>? {
        guard let query: String = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let apiKey = ProcessInfo.processInfo.environment["OMDB_API_KEY"] else { return nil }
        let dataTask = AF.request(
            "https://omdbapi.com/?apikey=\(apiKey)&s=\(query)&type=\(type)")
            .serializingDecodable(ListMovies.self)
        return await dataTask.result
    }
}
