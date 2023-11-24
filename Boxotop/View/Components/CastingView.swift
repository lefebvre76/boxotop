//
//  CastingView.swift
//  Boxotop
//
//  Created by loic lefebvre on 24/11/2023.
//

import SwiftUI
import SwiftData

struct CastingView: View {
    var actors: [String]

    var body: some View {
        if actors.count > 0 {
            MovieItemSubtitle(text: "movie.casting".localized())
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(actors, id: \.self) { actor in
                        VStack {
                            Image(systemName: "person.circle.fill")
                                .font(.title)
                                .padding()
                            Text("\(actor)")
                        }.padding()
                    }
                }
            }
        }
    }
}

#Preview {
    CastingView(actors: [
        "Charlie Chaplin",
        "Paulette Goddard",
        "Henry Bergman",
        "Stan Sandford"
    ])
}

#Preview {
    CastingView(actors: [])
}
