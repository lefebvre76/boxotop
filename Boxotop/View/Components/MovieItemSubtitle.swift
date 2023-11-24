//
//  MovieItemSubtitle.swift
//  Boxotop
//
//  Created by loic lefebvre on 24/11/2023.
//

import SwiftUI
import SwiftData

struct MovieItemSubtitle: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.title2)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
        Divider()
         .frame(height: 1)
         .padding(.horizontal)
         .background(.gray)
    }
}

#Preview {
    MovieItemSubtitle(text: "test")
}
