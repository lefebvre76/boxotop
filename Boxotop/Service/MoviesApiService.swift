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
            "https://omdbapi.com/?apikey=\(apiKey)&s=\(query)&type=\(type)&page=\(page)")
            .serializingDecodable(ListMovies.self)
        return await dataTask.result
    }
    
    static func show(id: String) async -> Result<DetailMovie, AFError>? {
        guard let apiKey = ProcessInfo.processInfo.environment["OMDB_API_KEY"] else { return nil }
        let dataTask = AF.request(
            "https://omdbapi.com/?apikey=\(apiKey)&i=\(id)&plot=full")
            .serializingDecodable(DetailMovie.self)
        return await dataTask.result
    }
}
