//
//  MovieViewModel.swift
//  Boxotop
//
//  Created by loic lefebvre on 23/11/2023.
//

import Foundation

class DetailMovieViewModel: ObservableObject {
    @Published public var movie: DetailMovie?
    @Published public var similarMovies: [Movie] = []
    @Published public var title: String
    @Published public var load = true
    
    private let id: String
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
    }
    
    func loadData() async {
        if let result = await MoviesApiService.show(id: self.id) {
            switch(result) {
            case let .success(value):
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.movie = value
                    self.load = false
                }
            default: break
            }
        }
    }
    
    func loadSimilarMovies() async {
        // FIXME : Use better aPI to load similar films
        if let result = await MoviesApiService.index(query: self.title) {
            switch(result) {
            case let .success(value):
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.similarMovies = value.search.filter({ movie in
                        movie.id != self.id
                    })
                }
            default: break
            }
        }
    }

}
