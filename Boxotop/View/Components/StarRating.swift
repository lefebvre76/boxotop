//
//  StarRating.swift
//  Boxotop
//
//  Created by loic lefebvre on 24/11/2023.
//

import Foundation
import SwiftUI

struct StarRating: View {

    var rating: Float
    var totalRating: String

    init(_ rating: String, totalRating: String) {
        self.rating = (Float(rating) ?? 0)/2
        self.totalRating = totalRating
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(1...5, id: \.self) { value in
                    Image(systemName: "star")
                        .symbolVariant(value <= Int(rating.rounded()) ? .fill : .none)
                        .foregroundColor(value <= Int(rating.rounded()) ? .yellow : .gray)
                        .font(.caption)
                }
                Text("\(rating.toString())/5").font(.caption2).bold()
            }
            Text("(\("movie.votes".localized(arguments: totalRating)))").font(.caption2)
        }
    }
}

#Preview {
    VStack {
        StarRating("1", totalRating: "1,000,000")
        StarRating("3,6", totalRating: "10,000")
        StarRating("3.6", totalRating: "10,000")
        StarRating("5.4", totalRating: "10,000")
        StarRating("5,4", totalRating: "10,000")
    }
}

