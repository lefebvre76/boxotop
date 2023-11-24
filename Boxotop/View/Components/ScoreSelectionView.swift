//
//  ScoreSelectionView.swift
//  Boxotop
//
//  Created by loic lefebvre on 24/11/2023.
//

import Foundation
import SwiftUI

struct StarRatingSlider: View {
    @Binding public var score: Int
    var minimum: Int = 1
    var maximum: Int = 5
    
    public var body: some View {
        HStack(spacing: 10) {
            ForEach(minimum...maximum, id: \.self) { value in
                Image(systemName: "star")
                    .symbolVariant((value <= score) ? .fill : .none)
                    .foregroundColor((value <= score) ? .yellow : .gray)
                    .font(.title)
                    .onTapGesture {
                        score = value
                    }
            }
        }
    }
}
