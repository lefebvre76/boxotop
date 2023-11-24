//
//  Rating.swift
//  Boxotop
//
//  Created by loic lefebvre on 24/11/2023.
//

import Foundation
import SwiftData

@Model
final class Feedback {
    @Attribute(.unique) var id: UUID = UUID()
    @Attribute(.unique) var movieId: String
    var score: Int
    var comment: String
    var timestamp: Date = Date()
    
    init(movieId: String, score: Int, comment: String) {
        self.movieId = movieId
        self.comment = comment
        self.score = score
    }
}
