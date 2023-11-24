//
//  FeedbackView.swift
//  Boxotop
//
//  Created by loic lefebvre on 24/11/2023.
//

import Foundation
import SwiftUI
import SwiftData

struct FeedbackView: View {
    var movieId: String

    @Query private var feedbacks: [Feedback]
    @Environment(\.modelContext) private var modelContext

    @State private var score = 0
    @State private var comment = ""
    @State private var isEditing = false
    @State private var feedback: Feedback?
    
    var body: some View {
        MovieItemSubtitle(text: "movie.my-review".localized())
        VStack {
            StarRatingSlider(score: $score).padding(.vertical)
            TextField("movie.my-review", text: $comment, axis: .vertical).padding(.bottom)
            Button("common.save") {
                save()
            }
        }.padding(.horizontal)
        .onAppear() {
            loadFeedback()
        }
    }
    
    func loadFeedback() {
        feedback = feedbacks.first(where: { f in
            f.movieId == movieId
        })
        if let f = feedback {
            score = f.score
            comment = f.comment
        }
    }

    func save() {
        if feedback == nil {
            let f = Feedback(movieId: movieId, score: score, comment: comment)
            feedback = f
            modelContext.insert(f)
        } else {
            feedback?.score = score
            feedback?.comment = comment
        }
    }
}



