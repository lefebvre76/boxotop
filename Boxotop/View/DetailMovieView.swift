//
//  DetailMovieView.swift
//  Boxotop
//
//  Created by loic lefebvre on 23/11/2023.
//

import SwiftUI
import SwiftData

struct DetailMovieView: View {
    @StateObject var detailMovieViewModel: DetailMovieViewModel

    var body: some View {
        ScrollView {
            Text("\(detailMovieViewModel.title)")
                .font(.title)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)

            if detailMovieViewModel.load {
                LoadView().padding(.top)
            } else {
                Text("movie.directed-by".localized(arguments: detailMovieViewModel.movie?.director ?? "common.unknow".localized()))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: detailMovieViewModel.movie?.poster ?? ""), content: { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .clipped()
                    },
                               placeholder: {
                        HStack {
                            Image(systemName: "film.fill")
                                .font(.largeTitle)
                        }
                        .frame(width: 100, height: 100)
                    }).padding(.horizontal)
                    VStack(alignment: .leading) {
                        Text("movie.released-at".localized(arguments: detailMovieViewModel.movie?.released ?? "common.unknow".localized())).padding(.bottom)
                        StarRating(detailMovieViewModel.movie?.rating ?? "", totalRating: detailMovieViewModel.movie?.votes ?? "0")
                    }
                    Spacer()
                }.padding(.bottom)
                FeedbackView(movieId: detailMovieViewModel.id)
                CastingView(actors: detailMovieViewModel.movie?.casting() ?? [])
                MovieItemSubtitle(text: "movie.plot".localized())
                Text("\(detailMovieViewModel.movie?.plot ?? "")").padding(.horizontal)
                if detailMovieViewModel.similarMovies.count > 0 {
                    SimilarMovies(movies: detailMovieViewModel.similarMovies).padding(.top)
                }
            }
            Spacer().onAppear {
                Task {
                    await detailMovieViewModel.loadSimilarMovies()
                }
            }
        }.onAppear {
            Task {
                await detailMovieViewModel.loadData()
            }
        }
    }
}
