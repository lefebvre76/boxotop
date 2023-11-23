//
//  MoviesViewModel.swift
//  Boxotop
//
//  Created by loic lefebvre on 22/11/2023.
//

import Foundation

class MoviesViewModel: ObservableObject {
    @Published public var movies: [Movie] = []
    @Published public var total: Int?
    @Published public var searchText: String = ""
    @Published public var showLoadMore = false
    
    private var currentPage = 1

    func loadData() {
        currentPage = 1
        Task {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.showLoadMore = false
                self.movies = []
            }
            await self.launchSearchMovies()
        }
    }
    
    func loadMoreData() {
        currentPage += 1
        Task {
            await self.launchSearchMovies()
        }
    }
    
    private func launchSearchMovies() async {
        if let result = await MoviesApiService.index(query: self.searchText, page: currentPage) {
            switch(result) {
            case let .success(value):
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.showLoadMore = false
                    self.movies.append(contentsOf: value.search)
                    self.total = Int(value.totalResults)
                    self.showLoadMore = self.movies.count < self.total ?? 0
                }
            default: break
            }
        }
    }
}
