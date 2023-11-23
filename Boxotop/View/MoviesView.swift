//
//  MoviesView.swift
//  Boxotop
//
//  Created by loic lefebvre on 22/11/2023.
//

import SwiftUI
import SwiftData

struct MoviesView: View {
    @StateObject var moviesViewModel = MoviesViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(moviesViewModel.movies, id: \.id) { movie in
                    Text("\(movie.title)")
                }
                .listRowSeparator(.hidden,
                                  edges: .all)
                if moviesViewModel.showLoadMore {
                    LoadView().onAppear {
                        moviesViewModel.loadMoreData()
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("list.find-your-movie")
            .searchable(text: $moviesViewModel.searchText)
            .onChange(of: moviesViewModel.searchText) {
                moviesViewModel.loadData()
            }
        }
    }
}

#Preview {
    MoviesView()
}
