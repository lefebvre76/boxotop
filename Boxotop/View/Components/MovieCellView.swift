//
//  MovieCellView.swift
//  Boxotop
//
//  Created by loic lefebvre on 23/11/2023.
//

import SwiftUI
import SwiftData

struct MovieCellView: View {
    var movie: Movie

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.poster), content: { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .clipped()
            },
                       placeholder: {
                HStack {
                    Image(systemName: "film.fill")
                        .font(.largeTitle)
                }
                .frame(width: 75, height: 75)
            })
            VStack {
                Text(movie.title).frame(maxWidth: .infinity, alignment: .leading).bold().padding(.top, 2)
                Text(movie.year).frame(maxWidth: .infinity, alignment: .leading).italic().padding(0)
                Spacer()
            }.frame(maxWidth: .infinity, minHeight: 75)
            Spacer()
        }
    }
}

#Preview {
    MovieCellView(movie: Movie(id: "01",
                               title: "Batman",
                               year: "1989",
                               poster: "https://m.media-amazon.com/images/M/MV5BMTYwNjAyODIyMF5BMl5BanBnXkFtZTYwNDMwMDk2._V1_SX300.jpg"))
}
