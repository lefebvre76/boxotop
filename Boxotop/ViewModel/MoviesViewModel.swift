//
//  MoviesViewModel.swift
//  Boxotop
//
//  Created by loic lefebvre on 22/11/2023.
//

import Foundation

class MoviesViewModel: ObservableObject {
    @Published public var result: ListMovies = ListMovies(search: [], totalResults: "0")
    @Published public var searchText: String = ""
    
    private var currentPage = 1

    func launchSearchMovies() async {
        if let result = await MoviesApiService.index(query: self.searchText, page: currentPage) {
            switch(result) {
            case let .success(value):
                await MainActor.run {
                    self.result = value
                }
            default: break
            }
        }
    }
}
