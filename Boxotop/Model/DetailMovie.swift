//
//  DetailMovie.swift
//  Boxotop
//
//  Created by loic lefebvre on 23/11/2023.
//

import Foundation

class DetailMovie: Decodable {
    var id: String
    var title: String
    var year: String
    var poster: String
    var director: String
    var released: String
    var rated: String
    var runtime: String
    var plot: String
    var boxOffice: String
    var rating: String
    var votes: String
    var actors: String
    
    private enum CodingKeys : String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case released = "Released"
        case rated = "Rated"
        case runtime = "Runtime"
        case director = "Director"
        case plot = "Plot"
        case boxOffice = "BoxOffice"
        case rating = "imdbRating"
        case votes = "imdbVotes"
        case actors = "Actors"
    }
    
    func casting() -> Array<String> {
        return self.actors.components(separatedBy: ", ")
    }
}
