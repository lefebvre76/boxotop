//
//  SimilarMovies.swift
//  Boxotop
//
//  Created by loic lefebvre on 24/11/2023.
//

import SwiftUI
import SwiftData

struct SimilarMovies: View {
    var movies: [Movie]

    var body: some View {
        if movies.count > 0 {
            MovieItemSubtitle(text: "movie.similars".localized())
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(movies, id: \.id) { movie in
                        VStack(alignment: .center) {
                            AsyncImage(url: URL(string: movie.poster), content: { image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 60)
                                    .clipped()
                            },
                                       placeholder: {
                                HStack {
                                    Image(systemName: "film.fill")
                                        .font(.largeTitle)
                                }
                                .frame(width: 75, height: 75)
                            })
                            Text(movie.title).bold().padding(.top, 2)
                            Text(movie.year).italic().padding(0)
                            Spacer()
                        }.frame(minWidth: 125, maxWidth: 150)
                    }
                }
            }
        }
    }
}

#Preview {
    SimilarMovies(movies: [
        Movie(id: "1", title: "Les temps modernes", year: "1936", poster: "https://upload.wikimedia.org/wikipedia/commons/3/36/Modern_Times_poster.jpg?uselang=fr"),
        Movie(id: "2", title: "Le Dictateur", year: "1940", poster: "https://upload.wikimedia.org/wikipedia/commons/9/9d/The_Great_Dictator_%281940%29_poster.jpg"),
        Movie(id: "3", title: "Monsieur Verdoux", year: "1947", poster: "https://upload.wikimedia.org/wikipedia/commons/6/63/Monsieur_Verdoux_poster.jpg?uselang=fr"),
        Movie(id: "4", title: "Les Feux de la rampe", year: "1952", poster: "https://fr.wikipedia.org/wiki/Les_Feux_de_la_rampe#/media/Fichier:Limelight_(1952)_-_original_theatrical_poster.jpeg")
    ])
}

#Preview {
    SimilarMovies(movies: [])
}
